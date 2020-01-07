read name
echo $name
mkdir $name
rmdir $name

for file in ./lorem/*
do
  echo $(basename "${file}") | sed -r "s/.*\///"
done

for file in ./lorem/*
do
  echo $file | sed -r "s/.+\/(.+)\..+/\1/"
done

for file in ./lorem/*
do
  #printf $(basename "${file}") | cut -d "." -f1 | wc -m # Is not working
  printf ${file} | sed -r "s/.+\/(.+)\..+/\1/" | wc -m
done
