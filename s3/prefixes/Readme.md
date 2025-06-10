

## Create our bucket
```sh
aws s3 mb s3://prefixes-fun-ab-0609
```

## Create our folder
```sh
aws s3api put-object --bucket prefixes-fun-ab-0609 --key="hello/"
```

## Create many folders
```sh
aws s3api put-object --bucket prefixes-fun-ab-0609 --key="Leer/todos/los/días/es/una/de/las/mejores/formas/de/adquirir/conocimientos/y/mejorar/nuestras/habilidades/cognitivas/A/través/de/la/lectura/no/solo/aprendemos/nuevas/palabras/sino/que/también/desarrollamos/la/imaginación/la/concentración/y/el/pensamiento/crítico/Además/leer/reduce/el/estrés/y/puede/ser/una/excelente/manera/de/desconectarse/del/mundo/digital/Ya/sea/una/novela/un/periódico/o/un/artículo/académico/dedicar/unos/minutos/al/día/a/la/lectura/puede/tener/un/impacto/positivo/en/nuestra/vida/personal/y/profesional/Por/eso/es/fundamental/cultivar/el/hábito/de/leer/con/frecuencia/yo/tú/él/ella/nosotros/vosotros/ellos/ser/estar/tener/hacer/decir/ir/ver/dar/saber/querer/llegar/pasar/deber/poner/parecer/quedar/creer/hablar/llevar/dejar/seguir/encontrar/llamar/venir/pensar/salir/volver/tomar/conocer/vivir/sentir/tratar/mirar/contar/empezar/esperar/buscar/existir/entrar/trabajar/escribir/perder/producir/ocurrir/entender/pedir/recibir/recordar/terminar/permitir/aparecer/conseguir/comenzar/seraa/"
```

## Try and break the 1024 limit
```sh
aws s3api put-object --bucket prefixes-fun-ab-0609 --key="Leer/todos/los/días/es/una/de/las/mejores/formas/de/adquirir/conocimientos/y/mejorar/nuestras/habilidades/cognitivas/A/través/de/la/lectura/no/solo/aprendemos/nuevas/palabras/sino/que/también/desarrollamos/la/imaginación/la/concentración/y/el/pensamiento/crítico/Además/leer/reduce/el/estrés/y/puede/ser/una/excelente/manera/de/desconectarse/del/mundo/digital/Ya/sea/una/novela/un/periódico/o/un/artículo/académico/dedicar/unos/minutos/al/día/a/la/lectura/puede/tener/un/impacto/positivo/en/nuestra/vida/personal/y/profesional/Por/eso/es/fundamental/cultivar/el/hábito/de/leer/con/frecuencia/yo/tú/él/ella/nosotros/vosotros/ellos/ser/estar/tener/hacer/decir/ir/ver/dar/saber/querer/llegar/pasar/deber/poner/parecer/quedar/creer/hablar/llevar/dejar/seguir/encontrar/llamar/venir/pensar/salir/volver/tomar/conocer/vivir/sentir/tratar/mirar/contar/empezar/esperar/buscar/existir/entrar/trabajar/escribir/perder/producir/ocurrir/entender/pedir/recibir/recordar/terminar/permitir/aparecer/conseguir/comenzar/seraa/hello.txt" --body="hello.txt"
```
