# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coaster
coasters = {
  'TOYAMA KASUMI' =>  0 ,
  'HANAZONO TAE' =>  2 ,
  'USHIGOME RIMI' =>  2 ,
  'YAMABUKI SAYA' =>  2 ,
  'ICHIGAYA ARISA' =>  0 ,
  'MITAKE RAN' =>  1 ,
  'AOBA MOCA' =>  2 ,
  'UEHARA HIMARI' =>  4 ,
  'UDAGAWA TOMOE' =>  2 ,
  'HAZAWA TSUGUMI' =>  2 ,
  'MARUYAMA AYA' =>  3 ,
  'HIKAWA HINA' =>  3 ,
  'SHIRASAGI CHISATO' =>  4,
  'YAMATO MAYA' =>  3,
  'WAKAMIYA EVE' =>  4,
  'MINATO YUKINA' =>  0,
  'HIKAWA SAYO' =>  1,
  'IMAI LISA' =>  1,
  'UDAGAWA AKO' =>  1,
  'SHIROKANE RINKO' =>  0,
  'TSURUMAKI KOKORO' =>  2,
  'SETA KAORU' =>  4,
  'KITAZAWA HAGUMI' =>  3,
  'MATSUBARA KANON' =>  5,
  'OKUSAWA MISAKI' =>  4,
}
# staff
staff = {
  'MINATO YUKINA' => 0,
  'UDAGAWA AKO' =>  2,
  'SHIROKANE RINKO' =>  1,
  'TOYAMA KASUMI' =>  1,
  'YAMABUKI SAYA' =>  1,
  'ICHIGAYA ARISA' =>  2,
  'MITAKE RAN' =>  3,
  'UDAGAWA TOMOE' =>  1,
  'HAZAWA TSUGUMI' =>  4,
  'MARUYAMA AYA' =>  4,
  'YAMATO MAYA' =>  1,
  'WAKAMIYA EVE' =>  3,
  'TSURUMAKI KOKORO' =>  0,
  'MATSUBARA KANON' =>  1,
  'OKUSAWA MISAKI' =>  2,
}

coasters.each do | character, value|
  value.times do
    Coaster.create({
        name:character,
        codeName:character.split(' ')[1],
        sold:false
    })
  end
end

staff.each do | character, value|
  value.times do
    WorkingCard.create({
        name:character,
        codeName:character.split(' ')[1],
        sold:false
    })
  end
end
