# -*- coding: utf-8 -*-

from dotenv import load_dotenv
load_dotenv()

#from __future__ import print_function    
import matplotlib.pyplot as plt
from scipy.spatial.distance import pdist, squareform
import pandas as pd 
import sys
import spotipy
from spotipy.oauth2 import SpotifyClientCredentials 
import json
import time
import spotipy.util as util
from pprint import pprint
from spotipy.oauth2 import SpotifyOAuth
from pprint import pprint
from time import sleep
import pprint
import random
import warnings
warnings.simplefilter('ignore')
client_credentials_manager = SpotifyClientCredentials()
sp = spotipy.Spotify(client_credentials_manager=SpotifyClientCredentials())
sp.trace=False

username='12166171313'

token = util.prompt_for_user_token(username=username)
PL=[]
if token:
    sp = spotipy.Spotify(auth=token)
    playlists = sp.user_playlists(username)
    for playlist in playlists['items']:
        PL.append(playlist['id'])
else:
    print("Can't get token for", username)

aleatorio = random.choice(PL)

plist = sp.user_playlist("spotify",aleatorio, fields="tracks,next")
tracks = plist["tracks"]
songs = tracks["items"]

ids = []
song = []
artist = []

for i in range(len(songs)):
    s = songs[i]["track"]
    ids.append(s["id"])
    song.append([s["id"],s["name"],s["popularity"],s["album"]["id"],s["album"]["name"],\
                 s["album"]["images"][0]["url"],s["album"]["release_date"],\
                 s["artists"][0]["id"],s["artists"][0]["name"]])
    
    a = sp.artist(s["artists"][0]["id"])
    img =""
    if len(a["images"])>0:
        img = a["images"][0]["url"]
    artist.append([a["id"],a["name"],a["popularity"],a["followers"]["total"],img])
    
dataArtists = pd.DataFrame(artist)

features = sp.audio_features(ids)
dataFeaturesPlayOrig = pd.DataFrame(features)

dataSongs = pd.DataFrame(song)

dataSongs.columns=["id","name","popularity","album id","album name",\
                 "album images url","album release_date",\
                 "artists id","artists name"]
dataArtists.columns=["id","name","popularity","followers","total"]

dA=dataArtists.drop_duplicates().sort_values(by='popularity',ascending=False).reset_index(drop=True)

artist_name = dA.name[0]
result = sp.search(q='artist:' + artist_name, type='artist')
name = result['artists']['items'][0]['name']
uri = result['artists']['items'][0]['uri']

artista = []

related = sp.artist_related_artists(uri)
for artist in related['artists'][:20]:
    artista.append([artist['id'],artist['name']])
    
datArt=pd.DataFrame(artista)

datArt.columns=(['id','name'])

sp = spotipy.Spotify(client_credentials_manager=SpotifyClientCredentials())
idss = []

for i in range (len(datArt)):    
    urn = datArt.id[i]
    response = sp.artist_top_tracks(urn)
    for track in response['tracks'][0:5]:
        idss.append(track["id"])

Features = sp.audio_features(idss)
dFPoten = pd.DataFrame(Features)

dFPoten.drop(['type', 'uri', 'track_href', 'analysis_url', 'duration_ms',\
              'time_signature'],axis=1,inplace=True)

DFP=dFPoten.set_index('id')

Modelo=dataFeaturesPlayOrig.mean()
datModel=pd.DataFrame(Modelo)
dFModel=datModel.T
dFModel['id']='Ref'
DFM=dFModel.set_index('id')

Matriz=pd.concat([dFModel, dFPoten])
Matrix=Matriz.set_index('id')

distancias=squareform(pdist(Matrix, 'euclidean'))

similitud=pd.DataFrame(1/(1+distancias),index=Matrix.index, columns=Matrix.index)

sim=similitud.Ref.sort_values(ascending=False)[1:]

simil_score=sim
reco=DFP.copy().T

for n,s in dict(simil_score).items():
    reco[n]=reco[n]*s
rec=reco.T
rec['Total']=rec.sum(axis=1)
play=rec.sort_values('Total',ascending=False)[:30]

max_tracks_per_call = 50
file=list(play.index)
tids = file
TRK=[]

for start in range(0, len(tids), max_tracks_per_call):
        results = sp.tracks(tids[start: start + max_tracks_per_call])
        for track in results['tracks']:
            TRK.append(track['id'])
            
playlist_name=('Recommendation ')
playlist_description='Ironhackers'

scope = "playlist-modify-public"
token = util.prompt_for_user_token(username, scope)

if token:
    sp = spotipy.Spotify(auth=token)
    sp.trace = False
    playlists = sp.user_playlist_create(username, playlist_name,\
                                        description=playlist_description)
else:
    print("Can't get token for", username)

playlist_id= playlists['id']
track_ids=TRK

scope = 'playlist-modify-public'
token = util.prompt_for_user_token(username, scope)

if token:
    sp = spotipy.Spotify(auth=token)
    sp.trace = False
    results = sp.user_playlist_add_tracks(username, playlist_id, track_ids)
    print(results)
else:
    print("Can't get token for", username)


