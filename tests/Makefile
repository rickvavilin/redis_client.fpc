REDIS_SRC = ../src
SYNAPSE_SRC = ../../synapse/source/lib
FPC_OPTIONS = -FEbin -FUobj
default_target: all
all: 
	fpc ./test_commands.lpr $(FPC_OPTIONS) -Fu$(REDIS_SRC) -Fu$(SYNAPSE_SRC)
	fpc ./test_protocol.lpr $(FPC_OPTIONS) -Fu$(REDIS_SRC) -Fu$(SYNAPSE_SRC)
	fpc ./test_parser.lpr $(FPC_OPTIONS) -Fu$(REDIS_SRC) -Fu$(SYNAPSE_SRC)

clean:
	rm ./bin/*
	rm ./obj/*