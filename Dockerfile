# Use an official Ruby runtime as a parent image
FROM ruby:latest

# Set the working directory to /app
WORKDIR /app

# Install Rails
RUN gem install rails
RUN apt-get update && apt-get install -y default-mysql-client

#Install mysql2
RUN gem install mysql2

# Bundle app dependencies
COPY Gemfile Gemfile.lock ./
RUN apt install default-mysql-client -y
RUN bundle install

ENV MYSQL_HOST=$AZURE_HOST \
    MYSQL_USER=$AZURE_UN \
    MYSQL_PASSWORD=$AZURE_PW! \
    MYSQL_DATABASE=$AZURE_DB

# Copy the rest of the application code
COPY . ./

# # # Expose port 3000 for the Rails server
# EXPOSE 3000

# # Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]


