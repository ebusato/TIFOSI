if ( $?LD_LIBRARY_PATH == 0 ) then
  setenv LD_LIBRARY_PATH /home/ebusato/Travail/TIFOSI
else
  setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:/home/ebusato/Travail/TIFOSI
endif
