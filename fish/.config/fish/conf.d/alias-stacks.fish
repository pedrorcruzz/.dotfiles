#Alias Python
abbr -a pipu "pip install --upgrade pip"
abbr -a pyvenv "python3 -m venv venv"
abbr -a sv "source venv/bin/activate.fish"
abbr -a dv "deactivate"
abbr -a fastapi-create "pip install fastapi uvicorn"


#Alias Laravel
abbr -a laravel-composer "composer create-project --prefer-dist laravel/laravel"
abbr -a laravel-inertia "composer require inertiajs/inertia-laravel"


#Alias Java
abbr -a spring-maven "spring init --build=maven --dependencies=web --java-version=x "
abbr -a spring-gradle "spring init --dependencies=web --java-version=x "
abbr -a build-gradle "./gradlew build"
