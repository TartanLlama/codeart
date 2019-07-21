module AltModes
    class Generator < Jekyll::Generator
        def generate(site)
          new_pages = []
          site.pages.each do |page|
            if page.name == '404.html'
              new_pages << page
            else
            light_page = Jekyll::Page.new(site, site.source, page.dir, page.name)
            page.data['theme'] = 'dark'
            light_page.data['theme'] = 'light'
            light_page.data['permalink'] = File.join(File.dirname(page.url), 'light', File.basename(page.url))
            puts(light_page.permalink)
            new_pages << light_page
            end
        end
        site.pages += new_pages
      end
    end
end