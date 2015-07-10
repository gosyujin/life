make html

cd build/html
git add -A
git com 'push to gh-pages'
git push -f origin gh-pages:gh-pages
cd ../../

