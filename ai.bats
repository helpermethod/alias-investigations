#!/usr/bin/env bash

load ai

@test 'should fail if an alias overrides a command' {
	alias rm='rm -r'

	run ai

	[[ $status = 1 ]]
	[[ $output = 'The alias rm overrides a command of the same name.' ]]
}

@test 'should fail if an alias overrides a builtin' {
	alias cd=z

	run ai

	[[ $status = 1 ]]
	[[ $output =~ 'The alias cd overrides a builtin of the same name.' ]]
}

@test 'should succeed if no alias overrides a builtin or command' {
	run ai

	[[ $status = 0 ]]
	[[ $output = 'No command or builtin is overridden.' ]]
}
