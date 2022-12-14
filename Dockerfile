# Using lightweight alpine image
FROM python:3.6-alpine

# Installing packages
RUN apk update
RUN pip install --no-cache-dir pipenv

# Defining working directory and adding source code
WORKDIR /usr/src/app
COPY Pipfile bootstrap.sh ./
COPY app ./app

# Install API dependencies
RUN pipenv install

# Start app
EXPOSE 4000
ENTRYPOINT ["/usr/src/app/bootstrap.sh"]