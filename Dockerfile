FROM jupyter/minimal-notebook                                                                                               
                                                                                                                            
USER    root                                                                                                                
                                                                                                                            
RUN     apt-get update && apt-get install net-tools                                                                         

#
# See https://github.com/jupyter/notebook/issues/4311 for specific issue with tornado
#
RUN    conda install --no-update-deps -c conda-forge \
       'tornado<6'

RUN	conda install nbserverproxy python-language-server flake8 autopep8 && \
	jupyter serverextension enable --py --sys-prefix nbserverproxy && \
	jupyter labextension install jupyterlab-server-proxy && \
	pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple jupyter-codeserver-proxy==1.0b1

	
RUN	cd /opt && \
	mkdir /opt/code-server && \
	cd /opt/code-server && \
	wget -qO- https://github.com/cdr/code-server/releases/download/1.939-vsc1.33.1/code-server1.939-vsc1.33.1-linux-x64.tar.gz | tar zxvf - --strip-components=1

ENV	PATH=/opt/code-server:$PATH

                                                                                                                            
USER    $NB_UID
