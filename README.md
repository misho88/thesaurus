# Command-Line Thesaurus

This uses the thesaurus files from LibreOffice, which are based on something from MyThes in Hunspell. 

# Usage

Look up some words:

```
$ thesaurus say toy
say:
    allege                          articulate                      aver                            enjoin                          enounce                         enunciate
    order                           pronounce                       read                            'sound out'                     state                           suppose
    tell                            assert (generic term)           asseverate (generic term)       chance (generic term)           convey (generic term)           express (generic term)
    feature (generic term)          'give tongue to' (generic term) have (generic term)             impart (generic term)           maintain (generic term)         opportunity (generic term)
    read (generic term)             recite (generic term)           record (generic term)           register (generic term)         request (generic term)          show (generic term)
    speculate (generic term)        utter (generic term)            verbalise (generic term)        verbalize (generic term)
toy:
    dally                             diddle                            fiddle                            flirt                             miniature                         play
    plaything                         'toy dog'                         act (generic term)                artefact (generic term)           artifact (generic term)           behave (generic term)
    'Canis familiaris' (generic term) copy (generic term)               do (generic term)                 dog (generic term)                'domestic dog' (generic term)     manipulate (generic term)
    move (generic term)               replica (generic term)            replication (generic term)        reproduction (generic term)       'toy with' (related term)
```

Look up synonyms of synonyms:

```
$ thesaurus pulchritudinous  # not very useful
pulchritudinous:
    beautiful (similar term)
$ thesaurus pulchritudinous --depth 1  # or -d1
pulchritudinous:
    beautiful (similar term):
        ugly (antonym)                 attractive (related term)      graceful (related term)        pleasing (related term)        aesthetic (similar term)       aesthetical (similar term)
        beauteous (similar term)       better-looking (similar term)  bonnie (similar term)          bonny (similar term)           comely (similar term)          dishy (similar term)
        esthetic (similar term)        esthetical (similar term)      exquisite (similar term)       fair (similar term)            fine-looking (similar term)    glorious (similar term)
        good-looking (similar term)    gorgeous (similar term)        handsome (similar term)        lovely (similar term)          picturesque (similar term)     pleasant (similar term)
        pretty (similar term)          pretty-pretty (similar term)   pulchritudinous (similar term) ravishing (similar term)       resplendent (similar term)     scenic (similar term)
        sightly (similar term)         splendid (similar term)        splendiferous (similar term)   stunning (similar term)        well-favored (similar term)    well-favoured (similar term)
```

Use fuzzy matching (via `fzf`):

```
$ thesaurus --fuzzy pulcritudnous  # or -f
pulchritudinous (from pulcritudnous):
    beautiful (similar term)
```

Look up all words that start with the same letters:

```
$ thesaurus 'translat.*'
translatable (from translat.*):
    convertible               transformable             transmutable              untranslatable (antonym)  commutable (similar term)
translate (from translat.*):
    interpret                 read                      render                    transform                 understand                alter (generic term)      ascertain (generic term)  be (generic term)
    change (generic term)     channel (generic term)    channelise (generic term) channelize (generic term) determine (generic term)  displace (generic term)   equal (generic term)      find (generic term)
    'find out' (generic term) ingeminate (generic term) iterate (generic term)    modify (generic term)     move (generic term)       paraphrase (generic term) reiterate (generic term)  repeat (generic term)
    rephrase (generic term)   restate (generic term)    retell (generic term)     reword (generic term)     transfer (generic term)   transmit (generic term)   transport (generic term)  understand (generic term)
translating program (from translat.*):
    translator                          'computer program' (generic term)   'computer programme' (generic term) program (generic term)              programme (generic term)
translation (from translat.*):
    displacement                         'interlingual rendition'             rendering                            transformation                       version
    'biological process' (generic term)  'change of integrity' (generic term) 'change of location' (generic term)  motion (generic term)                move (generic term)
    movement (generic term)              'organic process' (generic term)     paraphrase (generic term)            paraphrasis (generic term)           transformation (generic term)
    travel (generic term)                'written account' (generic term)     'written record' (generic term)
translational (from translat.*):
    'change of location'       nontranslational (antonym) travel (related term)
translator (from translat.*):
    interpreter                         transcriber                         'computer program' (generic term)   'computer programme' (generic term) go-between (generic term)
    intercessor (generic term)          intermediary (generic term)         intermediator (generic term)        linguist (generic term)             mediator (generic term)
    polyglot (generic term)             program (generic term)              programme (generic term)
```

Completely change how the searching works (`{word}` gets replaced with the word; use `{{` and `}}` for literal braces):

```
$ thesaurus --search "rg '^{word}\|'" cat
cat:
    'African tea'                    'Arabian tea'                    barf                             'be sick'                        'big cat'                        bozo
    cast                             CAT                              'cat-o'"'"'-nine-tails'          Caterpillar                      chuck                            'computed axial tomography'
    'computed tomography'            'computerized axial tomography'  'computerized tomography'        CT                               disgorge                         guy
    hombre                           honk                             kat                              khat                             puke                             purge
    qat                              quat                             regorge                          regurgitate                      retch                            sick
    spew                             spue                             'throw up'                       'true cat'                       upchuck                          vomit
    'vomit up'                       'keep down' (antonym)            'adult female' (generic term)    'adult male' (generic term)      egest (generic term)             eliminate (generic term)
    excitant (generic term)          excrete (generic term)           felid (generic term)             feline (generic term)            flog (generic term)              gossip (generic term)
    gossiper (generic term)          gossipmonger (generic term)      lash (generic term)              lather (generic term)            man (generic term)               newsmonger (generic term)
    pass (generic term)              rumormonger (generic term)       rumourmonger (generic term)      slash (generic term)             stimulant (generic term)         'stimulant drug' (generic term)
    strap (generic term)             'tracked vehicle' (generic term) trounce (generic term)           welt (generic term)              whip (generic term)              woman (generic term)
```

Look up some words in German (de_DE thesaurus needs to be installed):

```
$ thesaurus -l de_DE katze kanzler
katze:
    Hauskatze                                  Katze                                      'Prädator' (fachspr.) (Oberbegriff)        Felidae (Familie) (fachspr.)
    Katzen (Familie) (fachspr.)                Felidae (Familie) (fachspr.) (Oberbegriff) Katzen (Familie) (fachspr.) (Oberbegriff)  Beutegreifer (geh.) (Oberbegriff)
    Katze (Oberbegriff)                        Fellnase (ugs.)                            Mieze (ugs.)                               Miezekatze (ugs.)
    Muschi (ugs.)                              Pussy (ugs.)                               'Samtpfötchen' (ugs.)                      Samtpfote (ugs.)
    Stubentiger (ugs.)                         'Räuber' (ugs.) (Oberbegriff)              Raubtier (ugs., Hauptform) (Oberbegriff)   Dachhase (ugs., scherzhaft)
    'Büsi' (ugs., schweiz.)
kanzler:
    Bundeskanzler (männl.)       Kanzler (männl.)             Regierungschef (Oberbegriff) Bundeskanzlerin (weibl.)     Kanzlerin (weibl.)
```

# Installation

Some thesauri need to be downloaded. These come as `.dat` files from the LibreOffice project.
Rules exist in `Makefile` for English and standard German. More can be added as needed, but the file structure of the repo is a little irregular, so there's no easy way to automate it.
Downloading the `*.dat` files from the LibreOffice dictionary repo and placing them in the folder by hand should be fine, or you can modify the `Makefile`.
A corresponding index file which is easy to parse needs to be generated, too:

```
$ make
curl "https://raw.githubusercontent.com/LibreOffice/dictionaries/master/en/th_en_US_v2.dat" > en_US.dat
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 17.6M  100 17.6M    0     0  17.1M      0  0:00:01  0:00:01 --:--:-- 17.2M
./generate-idx en_US.dat > en_US.idx
# make install
install -d /usr/local/bin
install thesaurus /usr/local/bin
install -d /usr/local/share/thesaurus
install en_US.dat en_US.idx /usr/local/share/thesaurus
```

Use, e.g., `THESAURI='en_US de_DE'` to install both English and German.

To uninstall:

```
# make uninstall
rm -f /usr/local/bin/thesaurus
rm -f /usr/local/share/thesaurus/*.dat /usr/local/share/thesaurus/*.idx
rmdir --ignore-fail-on-non-empty /usr/local/share/thesaurus
```

To remove downloaded dictionaries:

```
$ make clean
rm -f en_US.dat en_US.idx
```

# Requirements

 - Python 3.10 or so with `natsort`
 - `grep`
 - `fzf` (for `--fuzzy`) 
 - `curl` (to download thesauri, or you could do it by hand)
