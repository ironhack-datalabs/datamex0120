echo "Hello World"
mkdir new_dir
rmdir new_dir
cp ./lorem/sed.txt lorem-copy
cp ./lorem/at.txt lorem-copy ; cp ./lorem/lorem.txt lorem-copy
cat ./lorem/sed.txt
cat ./lorem/at.txt ; cat ./lorem/lorem.txt
sed -n 1,3p ./lorem-copy/sed.txt
tail -n -3 ./lorem-copy/sed.txt
sed -i '$a Homo homini lupus.' ./lorem-copy/sed.txt
tail -n -3 ./lorem-copy/sed.txt
sed -i 's/et/ET/g' ./lorem-copy/at.txt
echo $USER
pwd
ls *.txt
cat ./lorem/sed.txt | wc -l
ls -FR | grep 'lorem' | grep -v / | wc -l
grep -r 'et' ./lorem
grep -o ' et ' ./lorem/at.txt | wc -l
grep -ro ' et ' ./lorem-copy | wc -l
