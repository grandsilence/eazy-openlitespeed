#!/usr/bin/env bash
# usage: bash -i install_ols

function run_module_error  {
	echo "ERROR: $1"
	echo 'Usage of run_module: <module_name|all> <action:help|install|remove|update>'
	exit 1
}

function module_mgr {
	local MODULE_NAME=$1
	local MODULE_ACTION=$2

	if [ -z $MODULE_NAME ]; then
		run_module_error 'Empty param <module_name>'
	fi

	if [ -z $MODULE_ACTION ]; then
		run_module_error 'Empty param <action>'
	fi

	if [[ $MODULE_ACTION == _* ]]; then
		run_module_error 'Param <action> starts with low dash (_) which is the dependency file'
	fi

	local MODULE_PATH=modules/$MODULE_NAME
	if [[ $MODULE_ACTION == help ]]; then
		echo "List of actions: (write without .sh and low dash names unavailable)"
		ls $MODULE_PATH
		exit 0
	fi

	local MODULE_FILE=$MODULE_PATH/$MODULE_ACTION'.sh'
	if [ ! -f $MODULE_FILE ]; then
		run_module_error "Module action-shell not found: $MODULE_FILE"
	fi

	bash -i "$MODULE_FILE"
}

ARG_MODULE=$1
ARG_ACTION=$2

if [[ $ARG_MODULE == all ]]; then
	ALL_MODULES=(global_aliases epel utils litespeed litespeed_php71 mysql phpmyadmin node9 node9_utils)

	for MODULE in "${ALL_MODULES[@]}"
	do
		echo "With module \"$MODULE\" do $ARG_ACTION..."
		module_mgr $MODULE $ARG_ACTION
	done

	exit
fi

module_mgr $ARG_MODULE $ARG_ACTION
