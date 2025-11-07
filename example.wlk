class Personaje {
  const fuerza
  const inteligencia
  var rol

  method fuerza() = fuerza
  method inteligencia() = inteligencia
  method rol() = rol
  method potencial() = fuerza * 10 + rol.potencialExtra()
  method cambaiarRol(nuevoRol) {
    rol = nuevoRol
  }
  method esInteligente()
  method esGroso() = self.esInteligente() || rol.esGroso()
}

class Orco inherits Personaje {
  override method potencial() = if(rol == brujo) fuerza * 10 + self.potencial() * 0.10
  override method esInteligente() = false
}

class Humano inherits Personaje {
  override method esInteligente() = self.inteligencia() > 50
}

object guerrero {
  method potencialExtra() = 100
  method esGroso() = Personaje.fuerza() > 50
}

object cazador {
  const mascota = null

  method potencialExtra() = mascota.potencial()
  method esGroso() = mascota.edad() > 10
}

object brujo {
  method potencialExtra() = 0
  method esGroso() = true
}

class Mascota {
  const fuerza
  const edad
  const tieneGarras

  method fuerza() = fuerza
  method edad() = edad
  method tieneGarras() = tieneGarras
  method potencial() = if(!self.tieneGarras()) self.fuerza() else self.fuerza() * 2
}

class Localidad {
  var ejercito = []

  method poderOfensivo() = ejercito.poderOfensivo()
  method serOcupada(unEjercito)
}

class Aldea inherits Localidad {
  const maxTropa
  override method serOcupada(unEjercito) {
    if(maxTropa < unEjercito.tamaño()){
      ejercito = [new Ejercito (tropa = unEjercito.losMasPoderosos())]
      unEjercito.quitarLosMasFuertes()
    }
    else {ejercito = unEjercito}
  }
}

class Ciudad inherits Localidad {
  override method poderOfensivo() = super() + 300
  override method serOcupada(unEjercito) {ejercito = unEjercito}
}

class Ejercito {
  const tropa = []

  method tamaño() = tropa.size()
  method poderOfensivo() = tropa.sum({m => m.potencial()})
  method invadir(unaLocalidad) {
    if(self.puedeInvadir(unaLocalidad)){unaLocalidad.serOcupada(self)}
  }
  method puedeInvadir(unaLocalidad) = self.poderOfensivo() > unaLocalidad.poderOfensivo()
  method losMasPoderosos() = self.ordenadosMasPoderosos().take(10)
  method ordenadosMasPoderosos() = tropa.sortBy({t1, t2 => t1.poderOfensivo() > t2.poderOfensivo()})
  method quitarLosMasFuertes() {tropa.removeAll(self.losMasPoderosos())}
}