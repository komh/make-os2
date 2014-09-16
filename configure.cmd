extproc sh

export ac_executable_extensions=".exe"
export CPPFLAGS="-D__ST_MT_ERRNO__"
export CFLAGS="-O2 -Zomf -Zmt"
export LDFLAGS="-Zlinker /exepack:2 -Zlinker /pm:vio -Zstack 0x6000"
export RANLIB="echo"
export AR="emxomfar"
./configure --prefix=/usr \
            --infodir=/usr/share/info \
            --mandir=/usr/share/man \
            --without-included-gettext
