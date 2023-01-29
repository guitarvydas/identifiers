here=`pwd`

all : identifierstest

identifierstest:
	./fab/fab ${here}/identifiers.ohm ${here}/identifiers.fab ${here}/emptysupport.js <${here}/test.c

identifierstest0:
	./fab/fab ${here}/identifiers.ohm ${here}/identifiers.fab ${here}/emptysupport.js <${here}/test.txt

identity:
	./fab/fab ${here}/identifiers.ohm ${here}/identity-identifiers.fab ${here}/emptysupport.js <${here}/test.txt

install: repos npmstuff

repos:
	multigit -r

npmstuff:
	npm install ohm-js yargs atob pako
