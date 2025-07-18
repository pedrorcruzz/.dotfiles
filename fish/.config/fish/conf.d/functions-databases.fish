set -x LC_MESSAGES en_US.UTF-8
#PostgreSQL
#Start and Stop PostgreSQL
function pg-start
    /Users/phrosa/.asdf/installs/postgres/17.4/bin/pg_ctl -D /Users/phrosa/.asdf/installs/postgres/17.4/data start
end

function pg-stop
    /Users/phrosa/.asdf/installs/postgres/17.4/bin/pg_ctl -D /Users/phrosa/.asdf/installs/postgres/17.4/data stop
end


#Connect to PostgreSQL
function pg-connect
    echo "Enter PostgreSQL user (default: postgres):"
    read user_input

    if test -z "$user_input"
        set user postgres
    else
        set user $user_input
    end

    psql -U $user -d postgres
end

#Docker PostgreSQL
function docker-pg-connect
    echo "Enter PostgreSQL user (default: postgres):"
    read user_input

    if test -z "$user_input"
        set user postgres
    else
        set user $user_input
    end

    docker exec -it postgres-container psql -U $user -d postgres
end

# Docker MySQL
function docker-mysql-connect
    echo "Enter MySQL user (default: root):"
    read user_input

    if test -z "$user_input"
        set user root
    else
        set user $user_input
    end

    echo "Connecting as user '$user'..."
    docker exec -it mysql-container mysql -u $user -p
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

function mongo-connect
    echo "Enter MongoDB user (default: phrosa):"
    read user_input

    if test -z "$user_input"
        set user phrosa
    else
        set user $user_input
    end

    mongosh -u $user -p mongo --authenticationDatabase admin
end
