La idea de este repo es probar como funciona [logstash](https://www.elastic.co/products/logstash), [elasticsearch](https://www.elastic.co/products/elasticsearch) y [kibana](https://www.elastic.co/products/kibana).

La configuración inicial es basada en esta [guía](https://www.digitalocean.com/community/tutorials/how-to-install-elasticsearch-logstash-and-kibana-4-on-ubuntu-14-04), para hacerlo más cómodo he decidido usar [Vagrant](https://www.vagrantup.com/). La idea es usar dos máquinas, una con todo los servicios y otra de cliente. 

Para la configuración de las máquinas empezaré usando [bash](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29) y vez que se consiga se hará también con un [Chef](https://www.chef.io/), la idea es ir poco a poco, primero adquirir conocimiento y después refinar las cosas.

Para hacer los tests he decicido usar [este plugin](https://github.com/jvoorhis/vagrant-serverspec) de [serverspec](http://serverspec.org/) para vagrant, la instalación es bastante sencilla y está bien documentada.

También se recomienda usar en Vagrant el plugin de [cachier](https://github.com/fgrehm/vagrant-cachier), aunque no es necesario, pero te ahorrará tu dosis habitual de cafeina/teina.

Se aceptan sugerencias/peticiones/PR ...
