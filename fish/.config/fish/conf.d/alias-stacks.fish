#Alias Python
abbr -a pipu "pip install --upgrade pip"
abbr -a pyvenv "python3 -m venv venv"
abbr -a sv "source venv/bin/activate.fish"
abbr -a dv "deactivate"
abbr -a fastapi-create-back "pip install fastapi uvicorn"
abbr -a fastapi-create-all "pip install fastapi[all]"


#Alias Laravel
abbr -a laravel-inertia "composer require inertiajs/inertia-laravel"


#Alias Java
abbr -a spring-build-maven "./mvnw clean install"
abbr -a spring-run-maven "./mvnw spring-boot:run"
abbr -a spring-classes-maven "./mvnw compile"

abbr -a spring-build-gradle "./gradlew build"
abbr -a spring-run-gradle "./gradlew bootRun"
abbr -a spring-classes-gradle "./gradlew classes"


#Alias Go
abbr -a go-get-gin "go get -u github.com/gin-gonic/gin"
abbr -a go-get-godotenv "go get github.com/joho/godotenv"
abbr -a go-get-mongo "go get -u go.mongodb.org/mongo-driver/mongo"
abbr -a go-get-gorm "go get -u gorm.io/gorm"
abbr -a go-get-gorm-postgres "go get -u gorm.io/gorm gorm.io/driver/postgres"
abbr -a go-get-gorm-mysql "go get -u gorm.io/gorm gorm.io/driver/mysql"
abbr -a go-get-postgres "go get -u github.com/jackc/pgx/v5/stdlib"
abbr -a go-get-mysql "go get -u github.com/go-sql-driver/mysql"
abbr -a go-install-debug "go install github.com/go-delve/delve/cmd/dlv@latest"
abbr -a go-install-sqlc "go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest"
abbr -a go-install-air "go install github.com/air-verse/air@latest"
abbr -a go-install-godotenv "go install github.com/joho/godotenv/cmd/godotenv@latest"
abbr -a go-install-goblueprint "go install github.com/melkeydev/go-blueprint@latest"
abbr -a go-ls-global "ls /Users/phrosa/.asdf/installs/golang/1.24.4/bin | grep air"
