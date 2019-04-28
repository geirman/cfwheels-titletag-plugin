component output="false" mixin="controller" {
  function init() {
    this.version = "1.4.5,2.0,2.0.1";
    return this;
  }
/**
 * DRY up your title tags. Allows you to define each page's title within it's view.
 *
 * [section: Plugins]
 * [category: Header, HTML Tags]
 *
 * @pageTitle The title of each individual page (e.g About Us)
 * @siteName Appears in all title tags (e.g. FrogQuest Photo Scavenger Hunts)
 * @prefix Appears before the separator (Default = " ")
 * @suffix Appears after the separator (Default = " ")
 * @lowercase Boolean declaring whether to lowercase the page's title (e.g. About Us > about us)
 * @reverse Boolean declaring which order to display siteName & pageTitle (Default = pageTitle | siteName)
 */
  public string function titleTag(
    string pageTitle,
    string siteName,
    string prefix = " ",
    string suffix = " ",
    string separator = "|",
    boolean lowercase = false,
    boolean reverse = false
  ) {
    var local = {};
    local.rv = "";
    local.pageTitle = "";
    local.spacer = arguments.prefix & arguments.separator & arguments.suffix;
    local.titleTag = "";

    if (StructKeyExists(arguments, "siteName") and StructKeyExists(variables, "pageTitle")) {
      local.pageTitle = variables['pageTitle'];

      if(arguments.lowercase) {
        local.pageTitle = LCase(local.pageTitle);
      }

      if(arguments.reverse) {
        local.titleTag = "<title>" & arguments.siteName & local.spacer & local.pageTitle & "</title>";
      } else {
        local.titleTag = "<title>" & local.pageTitle & local.spacer & arguments.siteName & "</title>";
      }

      local.rv = local.titleTag;
    }

    if(StructKeyExists(arguments, "pageTitle")) {
      variables.pageTitle = arguments.pageTitle;
    }

    return local.rv;
  }

}