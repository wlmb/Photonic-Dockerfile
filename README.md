# Photonic-Dockerfile
Dockerfile to build a docker Photonic image starting from a perldatalanguage container.

## Use:

You may build a docker image with the command

    $ docker build -t photonic https://github.com/wlmb/Photonic-Dockerfile.git

(replace photonic with whatever name you choose for your image).
If you prefer not to download the image on which Photonic is based,
wlmb/perldatalanguage, from dockerhub, you may build it with

    $ docker build -t perldatalanguage https://github.com/wlmb/PDL-Dockerfile.git
    $ docker build -t photonic perldatalanguage

Then, you may run the image with the following commands:

    $ xhost +local:
    $ docker run -p 22 -ti -v /tmp/.X11-unix/:/tmp/.X11-unix/ photonic

Once in your container you are in a full Debian/testing
environment. You can install further packages with apt, perl packages with cpanm,
run an interactive pdl interpreter as follows

    # pdl2
    pdl> demo 3d
    pdl> demo gnuplot
    .
    .
    .

and run Photonic programs, either standalone or within the interpreter.

    pdl> use Photonic::Geometry::FromB; #load some Photonic modules
    pdl> use Photonic::LE::NR2::EpsTensor;
    pdl> $b=zeroes(51,51,51)->rvals<13; #cubic lattice of spheres
    pdl> $g=Photonic::Geometry::FromB->new(B=>$b); #initialize geometry object
    pdl> $eps=Photonic::LE::NR2::EpsTensor->new(geometry=>$g, nh=>300); #initialize dielectric tensor
    pdl> $epsA=1+0.0*i(); #dielectric function of air
    pdl> $epsB=-10+.1*i(); #some metallic response
    pdl> print $eps->evaluate($epsA, $epsB); #dielectric function of cubic lattice of metallic spheres

## Authors:
   - Merlyn Jaqueline Juárez Gutiérrez @MerlynJJ
   - Luis Mochán  @wlmb