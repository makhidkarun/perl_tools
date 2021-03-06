
# INTRO

The perl_tools repository is a collection of Perl based tools to help
players and Game Masters (GMs, alternately DMs) generate Non-Player
Characters. 

For example, use "chargen.pl" to generate a single character:

```
  bin/chargen.pl
  Ilda Bouchet [F] 785576 
```

The "roll_dice.pl" code takes an optional "--roll <INT>" and provides 2d6 rols.

```
  bin/roll_dice.pl --rolls 4
  8 7 4 12
```

The "crewgen.pl" program uses a CSV data file and creates a crew for 
whatever ship matches the "name". 

```
  bin/crewgen.pl --config data/ships.csv --name 'Miss Rosa'
  Miss Rosa
  =========

  Flight Crew
  ===========
  German Joubert [M] A8C599 
  Appearence: Tall, average build. Short curly auburn hair, translucent skin. 
  Pilot-1 
  Temperament: Architect
  Plot: The enigma 

  Woodrow Marcel [M] A6B773 
  Appearence: Average height, very heavy set build. Very long straight white hair, tanned skin. 
  Navigation-1 
  Temperament: Inventor
  Plot: Slaying of kin unrecognized 

  Engineering
  ============
  Cinda Ayers [F] 987985 
  Appearence: Tall, heavy set build. Neck length straight chestnut hair, pale skin. 
  Enginnering-1 
  Temperament: Composer
  Plot: Revolt 

  Dominic Carter [M] 8958A3 
  Appearence: Tall, average build. Short curly brown hair, brown skin. 
  Enginnering-1 
  Temperament: Champion
  Plot: Discovery of the dishonour of a loved one 


  Medical
  =======
  Fidel Sanchez [M] 6947B7 
  Appearence: Average height, skinny build. Waist length curly chestnut hair, chocolate skin. 
  Medical-1 
  Temperament: Inspector
  Plot: Revolt 


  Gunnery
  =======
  Rachelle Maes [F] 3AB467 
  Appearence: Average height, heavy set build. Neck length frizzed brown hair, green skin. 
  Gunnery-1 
  Temperament: Protector
  Plot: Madness 

  Nelson Merlin [M] 764A34 
  Appearence: Average height, skinny build. Neck length straight auburn hair, gold skin. 
  Gunnery-1 
  Temperament: Teacher
  Plot: Tragedy 
```

## CODE REQUIREMENTS

The following Perl modules and other code are required:

```
  Perl
  ====
  DBI
  File::Basename
  File::Spec
  Getopt::Long
  Module::Build
  Moose
  namespace::autoclean 
  Test::Kwalitee
  Test::More

  Non Perl
  ========
  SQLite 3
```


## BUILD STATUS

Builds are tracked on [Travis-CI](https://travis-ci.org/makhidkarun/perl_tools/).

## INSTALLATION

To install this module, run the following commands:

	perl Build.PL
	./Build
	./Build test
	./Build install

## SUPPORT AND DOCUMENTATION

After installing, you can find documentation for this module with the
perldoc command.

    perldoc perl_tools

You can also look for information at:

    RT, CPAN's request tracker (report bugs here)
        https://rt.cpan.org/NoAuth/Bugs.html?Dist=.

    AnnoCPAN, Annotated CPAN documentation
        http://annocpan.org/dist/.

    CPAN Ratings
        https://cpanratings.perl.org/d/.

    Search CPAN
        https://metacpan.org/release/.


## LICENSE AND COPYRIGHT

Copyright (C) 2019 Leam Hall

This program is distributed under the MIT (X11) License:
L<http://www.opensource.org/licenses/mit-license.php>

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

