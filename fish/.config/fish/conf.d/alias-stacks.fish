#Alias Python
abbr -a pipu "pip install --upgrade pip"
abbr -a pyvenv "python3 -m venv venv"
abbr -a sv "source venv/bin/activate.fish"
abbr -a dv "deactivate"
abbr -a fastapi-create-back "pip install fastapi uvicorn"
abbr -a fastapi-create-all "pip install fastapi[all]"


#Alias Laravel
abbr -a laravel-composer "composer create-project --prefer-dist laravel/laravel"
abbr -a laravel-inertia "composer require inertiajs/inertia-laravel"


#Alias Java
abbr -a spring-create-maven "spring init --build=maven --dependencies=web,devtools,lombok --groupId=x --java-version=x "
abbr -a spring-create-gradle "spring init --dependencies=web,devtools,lombok --groupId=x --java-version=x "

abbr -a spring-build-maven "./mvnw clean install"
abbr -a spring-run-maven "./mvnw spring-boot:run"
abbr -a spring-classes-maven "./mvnw compile"

abbr -a spring-build-gradle "./gradlew build"
abbr -a spring-run-gradle "./gradlew bootRun"
abbr -a spring-classes-gradle "./gradlew classes"
