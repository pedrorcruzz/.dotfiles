set -x LC_MESSAGES en_US.UTF-8
#PostgreSQL
#Start and Stop PostgreSQL
function pg-start
    /Users/phrosa/.asdf/installs/postgres/17.4/bin/pg_ctl -D /Users/phrosa/.asdf/installs/postgres/17.4/data start
end

function pg-stop
    /Users/phrosa/.asdf/installs/postgres/17.4/bin/pg_ctl -D /Users/phrosa/.asdf/installs/postgres/17.4/data stop
end

#User PostgreSQL
function pg-connect-admin
    psql -U postgres -d postgres

end
#Input User
function pg-connect
    psql -U $argv
end

#Docker PostgreSQL
function docker-pg-connect-admin
    docker exec -it postgres-container psql -U postgres -d postgres
end
function docker-pg-connect
    docker exec -it postgres-container psql -U $argv
end


#MongoDB
function mongo-start
    mongod --dbpath ~/.asdf/installs/mongodb/8.0.5/data/db
end

function mongo-start-d
    mongod --dbpath ~/.asdf/installs/mongodb/8.0.5/data/db --fork --logpath ~/.asdf/installs/mongodb/8.0.5/mongo_logs/mongo.log
end

function mongo-stop
    ps aux | grep mongod
end

function mongo-connect-admin
    mongosh -u phrosa -p mongo --authenticationDatabase admin
end
