module AltModes
    class Generator < Jekyll::Generator
        def generate(site)
          new_pages = []
          site.pages.each do |page|
            if page.name == '404.html'
              new_pages << page
            else
            page.data['theme'] = 'dark'
            page.data['font'] = 'mono'
            page.data['themefolder'] = ''

            light_mono_page = Jekyll::Page.new(site, site.source, page.dir, page.name)
            light_mono_page.data['theme'] = 'light'
            light_mono_page.data['font'] = 'mono'
            light_mono_page.data['themefolder'] = 'lightmono/'
            light_mono_page.data['permalink'] = File.join(File.dirname(page.url), 'lightmono', File.basename(page.url))
            new_pages << light_mono_page

            light_prop_page = Jekyll::Page.new(site, site.source, page.dir, page.name)
            light_prop_page.data['theme'] = 'light'
            light_prop_page.data['font'] = 'prop'
            light_prop_page.data['themefolder'] = 'lightprop/'
            light_prop_page.data['permalink'] = File.join(File.dirname(page.url), 'lightprop', File.basename(page.url))
            new_pages << light_prop_page

            dark_prop_page = Jekyll::Page.new(site, site.source, page.dir, page.name)
            dark_prop_page.data['theme'] = 'dark'
            dark_prop_page.data['font'] = 'prop'
            dark_prop_page.data['themefolder'] = 'darkprop/'
            dark_prop_page.data['permalink'] = File.join(File.dirname(page.url), 'darkprop', File.basename(page.url))
            new_pages << dark_prop_page
            end
        end
        site.pages += new_pages
      end
    end
end