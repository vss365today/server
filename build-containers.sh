# Build the API
cd ../api
git pull
docker build -t vss365today-api:latest .

# Build the web interface
cd ../web
git pull
docker build -t vss365today-web:latest .

# Build the finder
cd ../finder
git pull
docker build -t vss365today-finder:latest .

# Return to the server directory
cd ../server
