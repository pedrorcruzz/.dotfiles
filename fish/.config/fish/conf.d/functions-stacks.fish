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
    echo "Enter project directory name (e.g., gin-app):"
    read projectDir

    echo "Enter Go module name (e.g., github.com/username/gin-app):"
    read moduleName

    mkdir -p $projectDir
    cd $projectDir

    go mod init $moduleName
    go get -u github.com/gin-gonic/gin

    string join "\n" \
    "package main" \
    "" \
    "import (" \
    "  \"net/http\"" \
    "" \
    "  \"github.com/gin-gonic/gin\"" \
    ")" \
    "" \
    "func main() {" \
    "  r := gin.Default()" \
    "  r.GET(\"/ping\", func(c *gin.Context) {" \
    "    c.JSON(http.StatusOK, gin.H{" \
    "      \"message\": \"pong\"," \
    "    })" \
    "  })" \
    "  r.Run() // listen and serve on 0.0.0.0:8080 (for windows \"localhost:8080\")" \
    "}" \
    > main.go

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
          <target>$javaVersion</target>\\
        </configuration>\\
      </plugin>\\
    </plugins>\\
  </build>" $pom
    end

   # cd $artifactId
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

    # cd $artifactId

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

     # cd $artifactId
end

function java-create-gradle
    echo "Enter project name (e.g., my-app):"
    read projectName

    echo "Enter project type (e.g., java-application, java-library):"
    read projectType

    mkdir $projectName
    # cd $projectName

    gradle init --type $projectType

end
