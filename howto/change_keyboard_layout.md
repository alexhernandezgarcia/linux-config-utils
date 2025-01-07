# How to change the keyboard layout?

Ubuntu and other Linux distributions come with a wide range of keyboard layout options, but there is chance you may want to change some details or even create an entirely new layout.

I have little experience with this, but I will illustrate how this is possible with my own case: I have used an English UK keyboard layout for many years because I find it comfortable for programming and because it natively incorporates easy access to characters I need in other languages, such as `á, é, ..., à, è, ..., ä, ö, ü, ..., ê, ô, ..., ñ, ...`. However, it does not perfectly fit my needs. In particular, I often write in French and I need to type the c-cedilla `ç` and `Ç` and the oethel œ. I thought it would be convenient for me to map the key combinations `AltGr + C` and `AltGr + Shift + C` to `ç` and `Ç`, respectively, and `AltGr + e` and `AltGr + E` to `œ` and `Œ`, respectively (I map the oethel to the `E` key because it is vacant with AltGr in the English layout, unlike the `O` key.

## Basic notions

With only a shallow understanding of the topic, it seems that on Ubuntu the keyboard layouts for the multiple languages are stored in `/usr/share/X11/xkb/symbols/`. This folder contains, for example, files named `gb`, `us` and `es` (among many others) for UK English, US English and Spanish, respectively.

These files contain blocks of code starting with line `default partial alphanumeric_keys` followed by a line starting with `xkb_symbols`. This blocks specify the variants of the layout. For example, the English UK layout has variants `intl`, `extd` and `colemak`, among others.

Finally, another relevant file is `/usr/share/X11/xkb/rules/evdev.xml`, which lists all the layouts and variants. If you create a new layout or variant, then you should modify this file too.

## Changing an existing layout or variant

Changing an existing layout is the first of the options we cover in this guide. The other alternative is [creating a new variant](#creating-a-new-layout-variant).

Changing an existing layout variant is relatively straightforward. Taking the aforementioned use case, suppose we are using the default English UK layout (default variant) and we want to map the key combinations `AltGr + C` and `AltGr + Shift + C` to `ç` and `Ç`, respectively, and `AltGr + e` and `AltGr + E` to `œ` and `Œ`, respectively.

Since we want to modify the layout for English UK, we need to update the file `/usr/share/X11/xkb/symbols/gb`. Before modifying the file, consider creating a backup copy.

If I peek into `/usr/share/X11/xkb/symbols/gb`, I see that the beginning of the file is

```
// Keyboard layouts for Great Britain.

default partial alphanumeric_keys
xkb_symbols "basic" {

    // The basic UK layout, also known as the IBM 166 layout,
    // but with the useless brokenbar pushed two levels up.

    include "latin"

    name[Group1]="English (UK)";

    key <TLDE>	{ [     grave,    notsign,          bar,          bar ]	};
    key <AE02>	{ [         2,   quotedbl,  twosuperior,    oneeighth ]	};
    key <AE03>	{ [         3,   sterling, threesuperior,    sterling ]	};
    key <AE04>	{ [         4,     dollar,     EuroSign,   onequarter ]	};

    key <AC11>	{ [apostrophe,         at, dead_circumflex, dead_caron]	};
    key <BKSL>	{ [numbersign, asciitilde,   dead_grave,   dead_breve ]	};

    key <LSGT>	{ [ backslash,        bar,          bar,    brokenbar ]	};

    include "level3(ralt_switch)"
};
```

This first set of lines shows the mappings included in the basic (default) English UK layout. The lines starting with `key` are followed by a key identifier (four characters inside `<>`) and a list with four items which correspond to the outputs mapped to that key: pressing the key by itself, with `Shift`, with `AltGr` and with `AltGr + Shift`.

The key identifier for alphanumeric keys starts with `A`. The second character indicates the row, starting from the bottom (the space bar is `AA`). Then, a number indicates the column, starting from the left and excluding special keys.

Thus, the key corresponding to `C` in the layout is identified by `AB03` and the line we need to add to the list of mappings is 

```
key <AB03> { [   c,                 C,        ccedilla,    Ccedilla ] }; // c C ç Ç
```

For the oethel character, we modify the key corresponding to `E`, which is `AD03`:

```
key <AD03> { [   e,                 E,              oe,          OE ] }; // e E œ Œ
```

At the time of writing, I do not know where to find the list of names, such as `ccedilla`, `Ccedilla`, `oe` and `OE` associated to each symbol, but many can be inferred from the files in `/usr/share/X11/xkb/symbols/`.

After adding the new lines to the file and saving the changes, we need to restart our X session (logout) in order to see the changes.


## Creating a new layout variant

As an alternative to modifying an existing layout, we can create a new variant of our own. This could be seen as a safer option, since we leave the original variants untouched.

We can create a new variant by adding the following block of lines at the end of `/usr/share/X11/xkb/symbols/gb`:

```
partial alphanumeric_keys
xkb_symbols "uk_multilang" {

    // The basic UK layout with priority to characters from other European
    // languages.

    include "gb(basic)"

    name[Group1]="English (UK, multilingual)";

    key <AB03> { [   c,                 C,        ccedilla,    Ccedilla ] }; // c C ç Ç
    key <AD03> { [   e,                 E,              oe,          OE ] }; // e E œ Œ
};
```

Note that I have used the identifier `uk_multilang` and the name "English (UK, multilingual)" for this new variant. These are your choice.

Additionally, in order to make the system aware of this new variant, we need to add it to `/usr/share/X11/xkb/rules/evdev.xml`. In particular, we can add the following lines as part of the layout with name `gb`:

```html
<variant>
  <configItem>
    <name>uk_multilang</name>
    <description>English (UK, multilingual)</description>
  </configItem>
</variant>
```

After editing these files, we need to restart the X sessions to apply the changes. Then, we should be able to select our new variant English (UK, multilingual) in the keyboard layout settings.

## References

- [Custom keyboard layout definitions, Ubuntu documentation](https://help.ubuntu.com/community/Custom%20keyboard%20layout%20definitions)
- [Create your own personal keyboard layout](https://ubuntuforums.org/showthread.php?t=188761&p=1092145#post1092145)
- [What are the steps needed to create a new keyboard layout?, askubuntu.com](https://askubuntu.com/questions/510024/what-are-the-steps-needed-to-create-a-new-keyboard-layout)
- [List of Unicode characters, Wikipedia](https://en.wikipedia.org/wiki/List_of_Unicode_characters)
