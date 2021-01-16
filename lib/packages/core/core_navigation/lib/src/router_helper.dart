abstract class RouterHelper {
  //region News

  Future<void> showNewsDetails(String newsItemId, String newsItemAuthorId);

  //endregion

  //region Deck

  Future<void> showDeckBuilder();

  //endregion

  //region Social Media

  Future<void> showYoutube();
  Future<void> showTwitter();
  Future<void> showDiscord();

  //endregion
}
