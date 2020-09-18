# Makefile template
#
# Just clone and customize!
#

# Set environment variables
OS_TYPE 			   	:=unix
MY_ENV_VAR				:="SomeValue"

# Check if OS is Windows
ifeq ($(OS),Windows_NT)
    OS_TYPE = windows
endif

define ensure_unix_program_exists
command -v ${1} >/dev/null 2>&1 || { echo >&2 "Program '${1}' is not installed!"; exit 1; }
endef

define ensure_windows_program_exists
where /q ${1} || ECHO "Program '${1}' is not installed!" && exit /F
endef

define ensure_program_exists
$(call ensure_$(OS_TYPE)_program_exists,${1})
endef

define env_var_check
	@echo "Verifying $1 var is set..."
	@: $(if $(value $1),,$(error $1 is not set. The task cannot continue))
endef

all-env-var-check:
	$(call env_var_check,MY_ENV_VAR)
	@echo "Ensure env vars are set in the environment"

prereqs:
	$(call ensure_program_exists,echo)
	@echo "Ensure the right programs for the project are available"

install-deps: prereqs
	@echo "Install dependencies locally needed to run the project"

start: all-env-var-check
	@echo "Start process locally"

format:
	@echo "Run a linter or formatter here"

test:
	@echo "Run all test cases"

stop:
	@echo "Stop process(es) gracefully (SIGTERM > SIGKILL ideally)"

ship-it: install-deps format test
	@echo "Ready to ship!"