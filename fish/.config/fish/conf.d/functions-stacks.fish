function create-jsconfig-json
    if not test -e jsconfig.json
        echo '{
  "compilerOptions": {
    "target": "ESNext",
    "module": "ESNext",
    "jsx": "react-jsx",
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"]
    }
  },
  "include": ["src"]
}' > jsconfig.json
    end
end

function go-create-gin
    echo "📁 Enter project directory name (e.g., gin-app):"
    read projectDir

    echo "📦 Enter Go module name (e.g., github.com/username/gin-app):"
    read moduleName

    if test -z "$moduleName"
        set moduleName "github.com/username/gin-app"
        echo "⚠️ No module name entered, using default: $moduleName"
    end

    mkdir -p $projectDir
    cd $projectDir

    echo "🔧 Initializing Go module..."
    go mod init $moduleName

    echo "🌐 Installing Gin framework..."
    go get -u github.com/gin-gonic/gin

    printf '%s\n' \
'package main' \
'' \
'import (' \
'  "net/http"' \
'' \
'  "github.com/gin-gonic/gin"' \
')' \
'' \
'func main() {' \
'  r := gin.Default()' \
'  r.GET("/ping", func(c *gin.Context) {' \
'    c.JSON(http.StatusOK, gin.H{' \
'      "message": "pong",' \
'    })' \
'  })' \
'  r.Run() // listen and serve on 0.0.0.0:8080' \
'}' > main.go

    echo ""
    echo "📚 Do you want to install any additional libraries?"
    echo "1 - PostgreSQL + GORM"
    echo "2 - GORM only"
    echo "3 - SQLC (generate type-safe code from SQL queries)"
    echo "4 - PostgreSQL driver (pgx)"
    echo "5 - MongoDB driver"
    echo "6 - MySQL + GORM"
    echo "7 - MySQL driver only"
    echo "8 - ALL"
    echo "9 - Enter custom install command"
    echo "0 - None"
    echo -n "Choose an option: "
    read choice

    switch $choice
        case 1
            echo "⬇ Installing GORM + PostgreSQL driver..."
            go get -u gorm.io/gorm
            go get -u gorm.io/driver/postgres
        case 2
            echo "⬇ Installing GORM..."
            go get -u gorm.io/gorm
        case 3
            echo "⬇ Installing SQLC..."
            go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest
        case 4
            echo "⬇ Installing PostgreSQL driver (pgx)..."
            go get -u github.com/jackc/pgx/v5
        case 5
            echo "⬇ Installing MongoDB driver..."
            go get -u go.mongodb.org/mongo-driver/mongo
        case 6
            echo "⬇ Installing GORM + MySQL driver..."
            go get -u gorm.io/gorm
            go get -u gorm.io/driver/mysql
        case 7
            echo "⬇ Installing MySQL driver (for sqlc/database/sql)..."
            go get -u github.com/go-sql-driver/mysql
        case 8
            echo "⬇ Installing SQLC..."
            go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest
            echo "⬇ Installing PostgreSQL driver (pgx)..."
            go get -u github.com/jackc/pgx/v5
            echo "⬇ Installing GORM..."
            go get -u gorm.io/gorm
            echo "⬇ Installing GORM PostgreSQL driver..."
            go get -u gorm.io/driver/postgres
            echo "⬇ Installing MongoDB driver..."
            go get -u go.mongodb.org/mongo-driver/mongo
            echo "⬇ Installing GORM MySQL driver..."
            go get -u gorm.io/driver/mysql
            echo "⬇ Installing MySQL driver (for sqlc/database/sql)..."
            go get -u github.com/go-sql-driver/mysql
        case 9
            echo "⌨️ Enter full 'go get' or 'go install' command:"
            read customLib
            eval $customLib
        case 0
            echo "✅ Skipping extra installations."
        case '*'
            echo "⚠️ Invalid option. Skipping."
    end

    echo ""
    echo "✅ Project '$projectDir' created!"
    echo "👉 To get started, run: cd $projectDir"

    echo -n "Press Enter to exit..."
    read
end

function laravel-composer
    echo "Enter project name (e.g., my-laravel-app):"
    read projectName

    composer create-project --prefer-dist laravel/laravel $projectName

end

function java-create-maven
    echo "Enter project name (e.g., my-app):"
    read artifactId

    echo "Enter groupId (e.g., com.example):"
    read groupId

    echo "Enter Java version (e.g., 21):"
    read javaVersion

    mvn archetype:generate \
        -DgroupId=$groupId \
        -DartifactId=$artifactId \
        -DarchetypeArtifactId=maven-archetype-quickstart \
        -DinteractiveMode=false

    set pom "$artifactId/pom.xml"
    if test -f $pom
        sed -i '' "/<\/project>/i\\
  <build>\\
    <plugins>\\
      <plugin>\\
        <groupId>org.apache.maven.plugins</groupId>\\
        <artifactId>maven-compiler-plugin</artifactId>\\
        <version>3.8.1</version>\\
        <configuration>\\
          <source>$javaVersion</source>\\
          <target>$javaVersion\\
        </configuration>\\
      </plugin>\\
    </plugins>\\
  </build>" $pom
    end
end

function spring-create-maven
    echo "Enter project name (e.g., my-app):"
    read artifactId

    echo "Enter groupId (e.g., com.example):"
    read groupId

    echo "Enter Java version (e.g., 17):"
    read javaVersion

    echo "Optional: Add more dependencies (comma-separated, e.g., 'security,data-jpa')"
    echo "Default: web,devtools,lombok"
    read extraDeps

    set defaultDeps "web,devtools,lombok"

    if test -n "$extraDeps"
        set deps "$defaultDeps,$extraDeps"
    else
        set deps "$defaultDeps"
    end

    spring init \
        --build=maven \
        --dependencies=$deps \
        --groupId=$groupId \
        --artifactId=$artifactId \
        --java-version=$javaVersion \
        $artifactId
end

function spring-create-gradle
    echo "Enter project name (e.g., my-app):"
    read artifactId

    echo "Enter groupId (e.g., com.example):"
    read groupId

    echo "Enter Java version (e.g., 17):"
    read javaVersion

    echo "Optional: Add more dependencies (comma-separated, e.g., 'security,data-jpa')"
    echo "Default: web,devtools,lombok"
    read extraDeps

    set defaultDeps "web,devtools,lombok"

    if test -n "$extraDeps"
        set deps "$defaultDeps,$extraDeps"
    else
        set deps "$defaultDeps"
    end

    spring init \
        --build=gradle \
        --dependencies=$deps \
        --groupId=$groupId \
        --artifactId=$artifactId \
        --java-version=$javaVersion \
        $artifactId
end

function java-create-gradle
    echo "Enter project name (e.g., my-app):"
    read projectName

    echo "Enter project type (e.g., java-application, java-library):"
    read projectType

    mkdir $projectName
    gradle init --type $projectType
end
