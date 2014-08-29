# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register_alias "text/html", :iphone

# 2013-01-18 inserting this snippet to prevent attacker from exploiting a vulnerability in the Rails system.
# Vulnerability has been fixed in Rails versions 3.2.11, 3.1.10, 3.0.19,
# so I guess we can delete this next time we upgrade our Rails installation.
ActionDispatch::ParamsParser::DEFAULT_PARSERS.delete(Mime::XML)
