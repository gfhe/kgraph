sudo apt update
sudo apt install -y gcc g++ cmake libboost-all-dev libgoogle-perftools-dev

kgraph_dir=`pwd`

cd .. &&  git clone https://github.com/xtensor-stack/xsimd.git && cd xsimd && mkdir build  && cd build \
&& cmake ..  && sudo make install 

cd kgraph_dir
mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=release ..
make
sudo make install
echo "done compile kgraph"

cd kgraph_dir
echo "installing kgraph python api"
sudo apt install -y libopenblas-dev
python setup.py install
echo "done"

# optional package wheel
python setup.py bdist_wheel
# 在 dist 目录中获取 wheel