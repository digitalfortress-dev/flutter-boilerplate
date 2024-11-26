## Automation Setup Script 
## Reference from https://github.com/Arnooodles/domain_driven_bloc/blob/main/src/my_app/Makefile

config_flutter_version: ## Set Flutter version is 3.24.5 with FVM
	fvm install 3.24.5
	fvm use 3.24.5
	fvm global 3.24.5

## Note: If you are using a specific flutter version, change '3.24.5' to the desired '{flutter version}' you want to use

clean: ## Delete the build/ and .dart_tool/ directories
	fvm flutter clean
	
pub_clean: ## Empty the entire system cache
	fvm flutter pub cache clean	

pub_get: ## Gets packages
	fvm flutter pub get

pub_outdated: ## Check the outdated packages
	fvm flutter pub outdated

pub_repair: ## Performs a clean reinstallation of all packages in your system cache
	fvm flutter pub cache repair

l10n: ## Generates strings
	fvm flutter gen-l10n
intl_utils: ## Generates strings with	intl_utils
	dart pub global run intl_utils:generate

build_runner: ## This command generates the files for the code generated dependencies
	fvm dart run build_runner build --delete-conflicting-outputs

build_runner_watch: ## This command generates the files for the code generated dependencies 'automatically during development' 
	fvm dart run build_runner watch --delete-conflicting-outputs

format: ## This command formats the codebase and run import sorter
	fvm dart format lib test

clean_rebuild: config_flutter_version clean pub_clean pub_get l10n build_runner format lint fix_lint

rebuild: config_flutter_version pub_get l10n build_runner format lint fix_lint

lint: ## Analyzes the codebase for issues
	fvm flutter analyze lib test
	fvm dart analyze lib test

fix_lint: ## Fixes lint issues
	fvm dart fix --apply

## Configuration to run
run_dev: fvm flutter run --flavor development -t lib/main.dev.dart

run_stag: fvm flutter run --flavor staging -t lib/main.staging.dart

run_prod: fvm flutter run --flavor production -t lib/main.product.dart

icons_launcher: ## This command runs icons_launcher
	fvm dart run icons_launcher:create

native_splash: ## This command runs flutter_native_splash
	fvm dart run flutter_native_splash:create

dependency_validator: ## This command runs dependency_validator
	fvm dart run dependency_validator