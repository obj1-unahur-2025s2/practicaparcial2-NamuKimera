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
  var habitantes
  const tamaño

  method habitantes() = habitantes
  method tamaño() = tamaño
}

class Aldea inherits Localidad {
  method defensas()
}

class Ciudad inherits Localidad {
  
  method defensas() = Ejercito.potencialTotal() + 300
}

class Ejercito {
  const miembros = []

  method potencialTotal() = miembros.sum({m => m.potencial()})
}

class Invasion {
  const ejercitoInvasor
  const ejercitoDefensor
  method realizarInvasion() {
    if(ejercitoInvasor.potencialTotal()> ejercitoDefensor.potencialTotal()){
      
    }
  }
}