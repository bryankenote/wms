import os

def clearConsole():
	command = 'clear'
	if os.name in ('nt', 'dos'):
		command = 'cls'
	os.system(command)

def prompt(promptString, error):
	clearConsole()
	print(promptString + '\n')
	if error is not None and error is not 0:
		print(error)
	return input()

def listPrompt(promptString, options):
	optionRange = range(1, len(options) + 1)
	while True:
		clearConsole()
		print(promptString + '\n\t')
		for i in optionRange:
			print(f'{i}. {options[i-1]}')
		
		option = input()
		if int(option) in optionRange:
			return option
