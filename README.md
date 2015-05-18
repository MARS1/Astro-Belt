# Astro-Belt

A *very* opinionated boilerplate for [Meteor](http://www.meteor.com).

**Astro-**: relating to the stars, celestial objects, or outer space.

**Belt**: move quickly in a specified direction.

*Alligators 'gonna alligate* :crocodile:

## Strong Opinions

All of the default Meteor goodness, and then some:

- [**Stylus**](http://learnboost.github.io/stylus) CSS preprocessor
- [**Bootstrap**](http://getbootstrap.com) *(no-glyph)* grid & components
- [**Font Awesome**](http://fortawesome.github.io/Font-Awesome) icons
- [**Coffescript**](http://coffeescript.org) JavaScript shorthand
- [**Iron Router**](http://github.com/iron-meteor/iron-router)

## Clone & Install

Assuming you have Git and Meteor installed:

```
git clone https://github.com/jesseflorig/Astro-Belt.git <your-app-name>

cd <your-app-name> && meteor
```

## Advanced Project Structure

```
client/      #runs on the client
server/      #runs on the server
lib/         #runs on both client & server first
public/      #static assets such as images
packages/    #all local modular & reusable code
```

### A note regarding file contents

I'm still looking for that perfect balance of logical separation. Not too thin; not too fat.

## Advanced Features

Most (if not all) of these features are/will be accomplished by overriding defaults or using existing packages. New packages will be created as needed.

- [ ] CLI scaffolding
- [ ] Dynamic dev environment ready
- [ ] SEO tricks
- [ ] Starter page layout templates (*in progress*)
- [x] Starter route structure
- [x] Default accounts via `server/fixtures.coffee`
- [x] Disable client account creation via `lib/config.coffee`
- [x] Beta invite system
- [x] User dashboard
 - [ ] Manage profile
 - [ ] Gravatar support
- [ ] Admin Dashboard
 - [ ] Manage custom pages
 - [ ] MOAR... (TBD)
- [ ] Simple Blog
 - [ ] Karma-style comments
- [ ] Example `favicon` set
- [ ] Starter tests :shit:

### Development Tools

**Open Source**

- [x] [Mongol](https://github.com/msavin/Mongol) - Visual editor for client-side Mongo documents
- [x] [JetSetter](https://github.com/msavin/JetSetter) - Visual editor for sessions

## Contributing

I'll gladly integrate any pull requests containing the unchecked items above. If you want to *claim* an item and let others know you're working it, open an [issue](https://github.com/jesseflorig/Astro-Belt/issues) and I'll update the `README`.

If you have your own opinions and/or suggestions, please open an [issue](https://github.com/jesseflorig/Astro-Belt/issues) so we can discuss. Otherwise, feel free to fork this if you find any of it useful!

## MOAR Boilerplates

- [Void](http://github.com/SachaG/Void) by [Sacha Greif](sachagreif.com/)
- [iron-cli](http://github.com/iron-meteor/iron-cli) (*formerly em*) by [Evented Mind](eventedmind.com/)
- [meteor-boilerplate](http://github.com/Differential/meteor-boilerplate) by [Differential](differential.com/)
- [Opinionated Skeleton](http://github.com/jamesdwilson/meteor-jw-opinionated-skeleton) by [James Wilson](github.com/jamesdwilson)
- [meteor-boilerplate](http://github.com/matteodem/meteor-boilerplate) by [Matteo De Micheli](github.com/matteodem)
