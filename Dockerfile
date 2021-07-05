#get image base debian
FROM wlmb/perldatalanguage
LABEL authors="Merlyn Jaqueline Juarez Gutierrez <merlynj@icf.unam.mx>, Wolf Luis Mochán Backal <mochan@icf.unam.mx>"
RUN cpanm Photonic
CMD export DISPLAY=:0; bash
