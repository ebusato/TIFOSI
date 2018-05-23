CXXFLAGS= -pthread -m64 -I/home/ebusato/Travail/root/5.34.32/root/include
LIBS = -L/home/ebusato/Travail/root/5.34.32/root/lib -lGui -lCore -lCint -lRIO -lNet -lHist -lGraf -lGraf3d -lGpad -lTree -lRint -lPostscript -lMatrix -lPhysics -lMathCore -lThread -lRooFit -lRooStats -pthread -lm -ldl -rdynamic

OPTCOMP =  -Wall -fexceptions -fPIC -O3 -DEXECUTABLE -DCPP11 -std=c++11 -pthread

CXX = g++

SRC = Model.C BayesianMCMC.C

SHAREDLIB = $(patsubst %.C,lib%.so,$(SRC))
OTHLibs = $(addprefix -l,$(basename $(SRC)))

all	:	libModel.so libBayesianMCMC.so

libModel.so: Models/Model.C Models/Model.h
	@$(CXX) -shared $(CXXFLAGS) $(OPTCOMP) -o $@ $<	

libBayesianMCMC.so: BayesianMCMC/BayesianMCMC.C BayesianMCMC/BayesianMCMC.h
	@$(CXX) -shared $(CXXFLAGS) $(OPTCOMP) -o $@ $<	

clean	:
	rm -f $(SHAREDLIB)  *.d
