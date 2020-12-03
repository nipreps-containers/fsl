# Use Ubuntu 16.04 LTS
FROM ubuntu:xenial-20200114

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
                    curl \
                    file \
                    libquadmath0 \
                    tclsh \
                    unzip \
                    wish \
                    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sSL https://fsl.fmrib.ox.ac.uk/fsldownloads/fsl-6.0.4-centos7_64.tar.gz | tar zxv --no-same-owner -C /opt \
    --exclude='fsl/doc' \
    --exclude='fsl/refdoc' \
    --exclude='fsl/python/oxford_asl' \
    --exclude='fsl/data/possum' \
    --exclude='fsl/data/first' \
    --exclude='fsl/data/mist' \
    --exclude='fsl/data/atlases' \
    --exclude='fsl/data/xtract_data' \
    --exclude='fsl/extras/doc' \
    --exclude='fsl/extras/man' \
    --exclude='fsl/extras/src' \
    --exclude='fsl/src'

ENV OS="Linux" \
    FSLDIR="/opt/fsl" \
    FSL_DIR="$FSLDIR" \
    FSLOUTPUTTYPE="NIFTI_GZ" \
    FSLMULTIFILEQUIT="TRUE" \
    LD_LIBRARY_PATH="$FSLDIR/lib:$LD_LIBRARY_PATH" \
    FSLTCLSH="/usr/bin/tclsh" \
    FSLWISH="/usr/bin/wish" \
    PATH="$FSLDIR/bin:$PATH"
