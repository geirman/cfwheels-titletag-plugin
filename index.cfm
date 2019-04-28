<h2>Description</h2>

<p>
  TitleTag is a resurection of <a href="mailto:yellowmcfly@gmail.com">Grant Copley's</a> YM_Headliner plugin orginally written for CFWheels v0.9.4.
  I've rewritten it and brought it up to date to work with CFWheels 2.x. Should also be compatible with older versions as well.
</p>

<p>
  If you've used the previous version, then there is a breaking change. The default order use to be "siteName | pageTitle" but now it's "pageTitle | siteName" simply because that's my personal preference.
</p>

<p>If your Wheels application has lots of actions and a shared layout, you might find yourself setting custom page title names in your controllers.</p>

<p>Here's an example:</p>

<blockquote>&lt;cfcomponent extends=&quot;Controller&quot;&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;cffunction name=&quot;about&quot;&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;cfset title = &quot;About us&quot;&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;/cffunction&gt;<br>
&lt;/cfcomponent&gt;</blockquote>
Then, in your <em>views\layout.cfm</em> file, you might have something like this:
<blockquote>&lt;head&gt;
&lt;title&gt;My website&lt;cfif StructKeyExists(variables, title)&gt;: &lt;cfoutput&gt;#title#&lt;/cfoutput&gt;&lt;/cfif&gt;&lt;/title&gt;
&lt;/head&gt;</blockquote>

<p>This works ... but page titles don't really belong in controllers, do they?</p>

<p>By moving these titles into your views, we can DRY your application a bit and reinforce the MVC design pattern in Wheels.</p>

<h3>Features</h3>

<ul>
	<li>Single tag to call</li>
	<li>Ability to set and manipulate the &lt;title&gt;&lt;/title&gt; in your layout from within your view.</li>
</ul>

<h3>How To Use</h3

<p>First, add this code to your main layout:</p>

<blockquote>&lt;head&gt;
&lt;cfoutput&gt;#titleTag(siteName=&quot;My website&quot;)#&lt;/cfoutput&gt;
&lt;/head&gt;</blockquote>

<p>Then, to set the page title, add this to each of your views:</p>

<blockquote>&lt;h1&gt;&lt;cfoutput&gt;#titleTag(pageTitle=&quot;My page title&quot;)#&lt;/cfoutput&gt;&lt;/h1&gt;</blockquote>

<p>When views are rendered, the page title will be included in the right spots:</p>

<blockquote>&lt;head&gt;<br>
&lt;title&gt;My page title | My website&lt;/title&gt;<br>
&lt;/head&gt;<br>
&lt;body&gt;<br>
    &lt;h1&gt;My page title&lt;/h1&gt;<br>
&lt;/body&gt;</blockquote>

<h3>Options</h3
<p>Use these options to customize the title format:</p>

<ul>
	<li>prefix (text between site name and separator)</li>
	<li>separator (text used to seperate site name from page title)</li>
	<li>suffix (text between separator and page title)</li>
	<li>lowercase (when true, the page title will be lowercase)</li>
	<li>reverse (when true, the page and site names will be reversed)</li>
</ul>

<p>Here are a few examples to give you ideas.</p>

<blockquote>&lt;cfoutput&gt;#titleTag(siteName=&quot;My website&quot;, separator=&quot;&amp;mdash;&quot;)#&lt;/cfoutput&gt;<br><br>

&lt;cfoutput&gt;#titleTag(siteName=&quot;My website&quot;, separator=&quot;&amp;mdash;&quot;, reverse=true)#&lt;/cfoutput&gt;<br><br>

&lt;cfoutput&gt;#titleTag(siteName=&quot;My website&quot;, separator=&quot;&amp;mdash;&quot;, reverse=true, lowercase=true)#&lt;/cfoutput&gt;</blockquote>

<p>&nbsp;</p>

<p>
	Author: Chris Geirman (chris@geirman.com)<br>
	Github: <a href="https://github.com/geirman/cfwheels-titletag-plugin">https://github.com/geirman/cfwheels-titletag</a><br>
	Last Updated: Sunday, April 28, 2019
  CFWheels Support:
</p>
