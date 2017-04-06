#!/bin/bash

# fix zlib error
export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"

MATAM_HOME=$PREFIX/opt/matam-$PKG_VERSION

mkdir -p $MATAM_HOME/{bin,scripts}
mkdir -p $PREFIX/bin
mkdir -p $PREFIX/lib


$PYTHON build.py build

# copy matam scripts
cp index_default_ssu_rrna_db.py $MATAM_HOME
cp bin/* $MATAM_HOME/bin
cp scripts/*.py $MATAM_HOME/scripts

# copy dependencies
COMPONENT_SEARCH=$MATAM_HOME/componentsearch
mkdir $COMPONENT_SEARCH
cp componentsearch/componentsearch $COMPONENT_SEARCH

OVGRAPHBUILD=$MATAM_HOME/ovgraphbuild/bin
mkdir -p $OVGRAPHBUILD
cp ovgraphbuild/bin/ovgraphbuild $OVGRAPHBUILD

SGA=$MATAM_HOME/sga/src/SGA/
mkdir -p $SGA
cp sga/src/SGA/sga $SGA

SORTMERNA=$MATAM_HOME/sortmerna
mkdir -p $SORTMERNA
cp sortmerna/{sortmerna,indexdb_rna} $SORTMERNA

VSEARCH=$MATAM_HOME/vsearch/bin
mkdir -p $VSEARCH
cp vsearch/bin/vsearch $VSEARCH


#libs
cp ./lib/bamtools/lib/libbamtools.so.2.4.1 $PREFIX/lib

# symlinks
ln -s $MATAM_HOME/index_default_ssu_rrna_db.py $PREFIX/bin/index_default_ssu_rrna_db.py
ln -s $MATAM_HOME/bin/matam_assembly.py $PREFIX/bin/matam_assembly.py
ln -s $MATAM_HOME/bin/matam_db_preprocessing.py $PREFIX/bin/matam_db_preprocessing.py
