### KittyCoin

- `onlyKittyPool` address should be able to `mint`
- `onlyKittyPool` address should be to `burn`

### KittyPool

- `onlyMeowtainer` address should be able to call `::meownufactureKittyVault()`
- Only permitted `token` should be used when calling `::depawsitMeollateral()`
- Only permitted `token` should be used when calling `::whiskdrawMeowllateral()`
- When `::burnKittyCoin()` is called, the specified `_amount` should be burnt from the `_onBehalfOf` address