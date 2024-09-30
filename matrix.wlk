object nave {
  const tripulantesEnNave = []

  method subirALaNave(tripulante){
    tripulantesEnNave.add(tripulante)
  }

  method bajarDeLaNave(tripulante){
    tripulantesEnNave.remove(tripulante)
  }

  //Retorna el número de pasajeros.
  method cuantosPasajerosHay(){
    return tripulantesEnNave.size()
  }

  //Retorna el objeto de mayor valor.
  method elPasajeroDeMayorVitalidad() {
    return tripulantesEnNave.max({c => c.vitalidad()})
  }

  //Retorna el objeto de menor valor.
  method elPasajeroDeMenorVitalidad() {
    return tripulantesEnNave.min({c => c.vitalidad()})
  }

  //Retorna un bool si la condición se cumple o no.
  method estaEquilibrada() {
    return
    self.elPasajeroDeMayorVitalidad().vitalidad() <=
    self.elPasajeroDeMenorVitalidad().vitalidad()*2
  }

  //Acciona el choce de la nave.
  method chocar() {
    tripulantesEnNave.forEach({p => p.saltar()})
    tripulantesEnNave.clear()
  }

  method acelerar(){
    self.pasajerosSinElElegido().forEach({pas => pas.saltar()})
  }

  method pasajerosSinElElegido() {
    return tripulantesEnNave.filter({p => !p.esElElegido()})
  }

  method esElElegido() {
    return tripulantesEnNave.filter({c => c.esElElegido()})
  }


}


//Personajes
object neo {
    var energia = 100

    method esElElegido() = true
    method saltar(){ energia = energia * 0.5}
    method vitalidad(){energia = energia * 0.1}
}

object morfeo {
    var vitalidad = 8
    var estaCansado = true
   
    method esElElegido() = false
    method vitalidad() = vitalidad
    method saltar() {
        vitalidad = 0.max(vitalidad - 1)
        estaCansado = !estaCansado
    }

}

object triniti {
    var energia = 100
    var vitalidad = 0
    method esElElegido() = false
    method saltar() {
    }
}