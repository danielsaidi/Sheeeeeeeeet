# Release Notes

Sheeeeeeeeet may have breaking changes in minor versions and revisions below 1.0.


## [0.9.0](https://github.com/danielsaidi/Sheeeeeeeeet/milestone/6?closed=1)

`ActionSheetDefaultPresenter` used to contain an embedded iPad presenter. I have
never been happy with this design, and have now redesigned this setup. I removed
the embedded presenter, merged `ActionSheetDefaultPresenter` with the base class
and now let the action sheet initializer resolve which default presenter to use.

I have felt a little lost in how to use the various select items, especially now
when Sheeeeeeeeet has select items, single-select items and multiselect items. I
initially designed the select item to be a regular item, that could indicate its
selected state. However, this behaved strange when another item became selected, 
since the initially selected item was not deselected. After introducing this new
item set, with single-select items and multiselect items, I have come to realize
that the base class is probably not a good stand-alone class and have decided to
make it private, to enforce using either of the two subclasses.

The new `isDismissableWithTapOnBackground` presenter property can be used to set
whether or not an action sheet can be dismissed by tapping on the background. It
is true by default for all presenters.

### Improvements:

* The demo app presents action sheets from the tapped cells. However, this means
  that on iPad, the popover will not use the full available screen height, since
  it will be displayed above or below the cell. I have changed this, so that the
  action sheet is presented from the cell's text label instead, which causes the
  action sheet to float above the cell and make use of the entire screen size.

### Bug fixes:

* `ActionSheetPopoverPresenter` did not release its action sheet whenever a user
  tapped on the background, causing a memory leak. This is fixed.

### Breaking changes:

* `ActionSheetDefaultPresenter` no longer have an embedded `iPadPresenter`. This
  is no longer needed, since the action sheet resolves the default presenter for
  the current device.

* `ActionSheetPresenterBase` has been removed and is now fully incorporated with
  the `ActionSheetDefaultPresenter` class.

* `ActionSheetSelectItem`s initializer has been made library internal to enforce
  using single and multi select items instead. This makes the api much clearer.

* I have chosen to remove the `peek & pop` features, since the implementation is
  so-so and it feels strange to peek and pop an action sheet. I hope that no one
  actually used this feature (since it looked horrible from 0.8, for some reason).
  You can still use Sheeeeeeeeeet with peek and pop, since the action sheets are
  regular view controllers, but you have to write the logic yourself.



## [0.8.4](https://github.com/danielsaidi/Sheeeeeeeeet/milestone/5?closed=1)

Sheeeeeeeeet now has a new `ActionSheetMultiSelectToggleItem` item, which can be
used to select and deselect all multiselect items in the same group.



## [0.8.3](https://github.com/danielsaidi/Sheeeeeeeeet/milestone/4?closed=1)

In this version, no cancel buttons will be displayed in popover presented action
sheets, since the convention is to dismiss a popover by tapping anywhere outside
the popover callout view.



## 0.8.1

The color properties in `ActionSheetSelectItemAppearance` have been renamed. The
change is small, but the change will be breaking if you have used the properties
to customize your action sheet appearances.



## [0.8.0](https://github.com/danielsaidi/Sheeeeeeeeet/milestone/3?closed=1)

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
