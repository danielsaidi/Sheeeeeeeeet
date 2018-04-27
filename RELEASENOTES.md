# Release Notes

Sheeeeeeeeet may have breaking changes in minor versions and revisions below 1.0.


## 0.9.0

The new `isDismissableWithTapOnBackground` presenter property can be used to set
whether or not an action sheet can be dismissed by tapping on the background. It
is true by default for all presenters.

This version also has some breaking changes:

* I have made `ActionSheetSelectItem` private, to enforce using single and multi
  select items. This makes the api much clearer.

* I have chosen to remove the peek/pop features, since the implementation is not
  that good and it feels strange to peek and pop an action sheet. I hope that no
  one actually used this stuff (especially since it looked horrible). You can of
  course still use Sheeeeeeeeeet with peek and pop, but now you have to write it
  yourself...which is really easy to do.


## 0.8.1

The color properties in `ActionSheetSelectItemAppearance` have been renamed. The
change is small, but if you have customized these values in your app, the change
will be breaking and require you to use the new property names.



## 0.8.0

Breaking changes! The toggle item has been a strange part of Sheeeeeeeeet. It is
basically a select item with individual styling, which is easy to customize with
the built-in appearance. We have therefore decided to remove this item type from
`Sheeeeeeeeet`, with hopes that it will make the api more obvious.

The `ActionSheetSingleSelectItem` tap behavior has been changed to use `.dismiss`.
This makes the behavior consistent with the standard select item. This means you
have to manually set the tap behavior `.none` whenever you need that behavior.

We have added a `ActionSheetSingleSelectItemAppearance` class to the library and
added a new `singleSelectItem` property to the appearance class.



## 0.7.1

Select items can now have a separate select tint color for the left icon.



## 0.7.0

We have added a subtitle to the section title item and clarified the examples by
moving action sheets into their own separate classes.
