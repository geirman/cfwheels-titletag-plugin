# About
DRY up your title tags in CFWheels 2.x. Allows you to define each page's title within it's view.

# Description
 TitleTag is a resurrection of [Grant Copley's](mailto:yellowmcfly@gmail.com) YM_Headliner plugin orginally written for CFWheels v0.9.4. I've rewritten it and brought it up to date to work with CFWheels 2.x. Should also be compatible with older versions as well.

If you've used the previous version, then there is a breaking change. The default order use to be "siteName | pageTitle" but now it's "pageTitle | siteName" simply because that's my personal preference.

If your Wheels application has lots of actions and a shared layout, you might find yourself setting custom page title names in your controllers.

Here's an example:

```
<cfcomponent extends="Controller">
    <cffunction name="about">
        <cfset title = "About us">
    </cffunction>
</cfcomponent>
```

Then, in your views\layout.cfm file, you might have something like this:

```
<head> <title>My website<cfif StructKeyExists(variables, title)>: <cfoutput>#title#</cfoutput></cfif></title> </head>
```

This works ... but page titles don't really belong in controllers, do they?

By moving these titles into your views, we can DRY your application a bit and reinforce the MVC design pattern in Wheels.

# Features

* Single tag to call
* Ability to set and manipulate the <title></title> in your layout from within your view.

# How To Use

First, add this code to your main layout:

```
<head>
  <cfoutput>
  #titleTag(siteName="My website")#
  </cfoutput>
</head>
```

Then, to set the page title, add this to each of your views:

```
<h1>
  <cfoutput>
  #titleTag(pageTitle="My page title")#
  </cfoutput>
</h1>
```

When views are rendered, the page title will be included in the right spots:

```
<head>
  <title>My page title | My website</title>
</head>
<body>
  <h1>My page title</h1>
</body>
```

# Options

* prefix (text between site name and separator)
* separator (text used to seperate site name from page title)
* suffix (text between separator and page title)
* lowercase (when true, the page title will be lowercase)
* reverse (when true, the page and site names will be reversed)

# Example Usage

```
<cfoutput>#titleTag(siteName="My website", separator="&mdash;")#</cfoutput>
<cfoutput>#titleTag(siteName="My website", separator="&mdash;", reverse=true)#</cfoutput>
<cfoutput>#titleTag(siteName="My website", separator="&mdash;", reverse=true, lowercase=true)#</cfoutput>
```

