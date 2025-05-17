set -x LC_MESSAGES en_US.UTF-8
#PostgreSQL
#Start and Stop PostgreSQL
function startpg
    /Users/phrosa/.asdf/installs/postgres/17.4/bin/pg_ctl -D /Users/phrosa/.asdf/installs/postgres/17.4/data start
end

function stoppg
    /Users/phrosa/.asdf/installs/postgres/17.4/bin/pg_ctl -D /Users/phrosa/.asdf/installs/postgres/17.4/data stop
end

#User PostgreSQL
function joinpgp
    psql -U postgres -d postgres

end
#Input User
function joinpg
    psql -U $argv
end

#Docker PostgreSQL
function joindpgp
    docker exec -it postgres-container psql -U postgres -d postgres
end
function joindpg
    docker exec -it postgres-container psql -U $argv
end


#MongoDB
function startmongo
    mongod --dbpath ~/.asdf/installs/mongodb/8.0.5/data/db
end

function startmongod
    mongod --dbpath ~/.asdf/installs/mongodb/8.0.5/data/db --fork --logpath ~/.asdf/installs/mongodb/8.0.5/mongo_logs/mongo.log
end

function stopmongo
    ps aux | grep mongod
end

function joinmongo
    mongosh -u phrosa -p mongo --authenticationDatabase admin
end
