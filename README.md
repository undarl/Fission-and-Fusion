# Fission and Fusion

Adds portable fission generators, radioisotope thermoelectric generators, and factory-level fusion power as well as making portable fusion reactors much more difficult to research. Each branch of this mod can be toggled on and off individually in the mod startup options.

## Portable Fission Power
**Portable Nuclear Reactors:** Two-thirds the size and power output of portable fusion reactors, these run off of portable fuel cells created in much the same way as the full size fuel cells used in nuclear reactors.

**Portable Uranium Fuel Cells:** Much smaller and less efficient than full size nuclear fuel cells, but they also require fewer overall resources to create.

## Radioisotope Generators

**Radioisotopes:** These non-fissionable byproducts have a chance to be returned when reprocessing any kind of nuclear fuel cells. While they aren't useful for making new fuel cells, the heat of their decay can be harnessed by RTGs.

**Radioisotope Thermoelectric Generators:** Maintenance-free energy sources for equipment, powered by the heat of decaying radioisotopes. Not as efficient as reactors, but a step up from solar panels.

**Radioisotope Thermoelectric Generator Arrays:** An array of RTGs designed to provide factory-level power.

## Fusion Power

**Heavy Water:** Water rich in deuterium, a heavier isotope of hydrogen, it can be separated out of large amounts of normal water via distillation or hydrogen sulfide exchange in a chemical plant.

**Deuterium Gas:** Gaseous deuterium, derived from heavy water via electrolysis in a chemical plant. It is used as fusion fuel -- directly by fusion generators, indirectly by fusion reactors.

**Deuterium Pellets:** Pellets of supercooled deuterium created in a chemical plant, used as fuel by fusion reactors.

**Inertial Fusion Energy Reactors:** The first available fusion power option, these reactors fuse deuterium pellets to generate heat which is then funneled into heat exchangers and turbines in the same way as nuclear reactors. Temperature and remaining fuel data are available to the circuit network via a panel on the front of the reactor.

**Magnetic Conversion Fusion Generators:** These more advanced facilities fuse deuterium gas directly, and produce electricity using direct energy conversion. They are not as powerful individually as fusion reactors, but they are somewhat smaller, more efficient, and require no other power generation infrastructure.

## Current Integrations with Other Mods
* [Nuclear Fuel](https://mods.factorio.com/mods/GotLag/Nuclear%20Fuel) by GotLag
  * Add radioisotope chance to plutonium fuel reprocessing
  * Add plutonium chance to portable uranium cell reprocessing
  * Add portable plutonium cells and reprocessing for them
  * Add portable MOX cell recipe
* [Angel's Petro Chemical Processing](https://mods.factorio.com/mods/Arch666Angel/angelspetrochem) by Arch666Angel
  * Change heavy water hydrogen sulfide exchange recipe to use Angel's hydrogen sulfide
  * Change deuterium electrolysis recipe to use Angel's electrolysers and create oxygen as a byproduct

## Changelog
* 0.2.0 - Increased default fusion reactor output by 50%; created a startup setting for reactor output; rebalanced fusion fuel recipes; removed workaround for generator heat capacity bug.
* 0.1.0 - Initial release

## Future Possibilities
* Upgraded graphics
  * I've started [a request thread](https://forums.factorio.com/viewtopic.php?f=15&t=46417) in the Factorio Texture Packs forum should anyone with artistic skill feel inspired.
* Bob's integrations
  * I do not play with Bob's mods myself, so I'd need input and recipe ideas from people who do.
## Code Attribution
* Fusion reactor interface logic: adapted from GotLag's [Reactor Interface](https://mods.factorio.com/mods/GotLag/Reactor%20Interface) mod.
* Fusion generator self-heating logic: adapted from the diesel generator in Klonan's [KS Power](https://mods.factorio.com/mods/Klonan/KS_Power) mod.
## Art Attribution
* **advanced_fusion:** cropped by Undarl under the [CC BY-SA 3.0 license](https://creativecommons.org/licenses/by-sa/3.0/). The [original work](https://commons.wikimedia.org/w/index.php?curid=12836818) is by [Culham Centre for Fusion Energy](http://www.fusion.org.uk/MAST.aspx), CC BY-SA 3.0.
* **fission-reactor-equipment:** modified by Undarl. The [original work](https://commons.wikimedia.org/wiki/File:Containment_destruction.jpg) is a public domain image from the [NRC](http://www.nrc.gov), and has had a public domain radiation trefoil image added to it.
* **fusion-generator, fusion-reactor, fusion-reactor-lights, and rtg-array:** modified from artwork released for Factorio mod use by Arch666Angel on a Factorio forum [thread of discarded artwork](https://forums.factorio.com/viewtopic.php?f=15&t=40923).
* **fusion_power:** cropped by Undarl under the [CC BY-SA 3.0 license](https://creativecommons.org/licenses/by-sa/3.0/). The [original work](https://commons.wikimedia.org/w/index.php?curid=20512199) is by Lawrence Livermore National Laboratory - Own work, CC BY-SA 3.0.
* **fusion-reactor-interface:** modified by Undarl under the [CC BY-SA 3.0 license](https://creativecommons.org/licenses/by-sa/3.0/). The [original work](https://commons.wikimedia.org/wiki/File:Georgetown_PowerPlant_Museum_gauges_18.jpg) is by Joe Mabel, own work, CC BY-SA 3.0.
* **reactor-interface-led:** borrowed from the [Reactor Interface](https://mods.factorio.com/mods/GotLag/Reactor%20Interface) mod by GotLag.
* **rtg:** modified by Undarl. The [original work](https://commons.wikimedia.org/wiki/File:Cassini%27s_RTG.jpg) is a public domain image from [NASA](http://nasa.gov).
* The portable fuel cell icons, their depleted variants, the deuterium pellets icon, and the temperature icon were assembled by Undarl from public domain images.
* The gas-deuterium, liquid-heavy-water, and reprocess-portable-uranium-cell icons were created from Factorio game assets modified and combined with public domain images.
* The radioisotopes icon is a color-shifted variant of the Factorio U-235 game asset.
* The reprocess-portable-breeder-cell icon was assembled by Undarl from public domain images and the plutonium icon graphic from GotLag's [Nuclear Fuel](https://mods.factorio.com/mods/GotLag/Nuclear%20Fuel) mod.
## Other Credits and Thanks
* **Roxor128**: for the [core ideas](https://forums.factorio.com/viewtopic.php?f=6&t=44430) for the fusion section of this mod.
* **GotLag**: for inspiration from the [Reactors](https://mods.factorio.com/mods/GotLag/Reactors) mod.
* **Sirenfal**: for help and patience while I was taking my first steps as a Factorio modder.
* **Arumba**: for getting me interested in Factorio in the first place via his YouTube videos.
