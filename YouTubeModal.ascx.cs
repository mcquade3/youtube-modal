using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ektron.Cms;
using Ektron.Cms.API;
using Ektron.Cms.Widget;
using Ektron.Cms.Common;

public partial class widgets_YouTubeModal : System.Web.UI.UserControl, IWidget
{
    private IWidgetHost _host;
    private string _videoID;
    private string _title;
    private string _subtitle;

    [WidgetDataMember("cPJMlf0I5xo")]
    public string VideoID
    {
        get { return _videoID; }
        set { _videoID = value; }
    }

    [WidgetDataMember("Academic Resources")]
    public string Title
    {
        get { return _title; }
        set { _title = value; }
    }

    [WidgetDataMember("What academic resources are available?")]
    public string Subtitle
    {
        get { return _subtitle; }
        set { _subtitle = value; }
    }

    public string VideoURL
    {
        get { return string.Format("https://www.youtube-nocookie.com/embed/{0}?autoplay=1;rel=0&amp;showinfo=0;", VideoID); }
    }

    public string VideoThumbnail
    {
        get { return string.Format("https://img.youtube.com/vi/{0}/maxresdefault.jpg", VideoID); }
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        string sitepath = new CommonApi().SitePath;
        JS.RegisterJSInclude(this, sitepath + "widgets/YouTubeModal/js/youtubemodal.js", "EktronWidgetYouTubeModalJS");
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        _host = Ektron.Cms.Widget.WidgetHost.GetHost(this);
        _host.Title = "YouTube Modal";
        _host.Edit += new EditDelegate(EditButtonClicked);
        ViewSet.SetActiveView(View);
    }

    protected void EditButtonClicked(string settings)
    {
        URLtextBox.Text = VideoID;
        titleTextBox.Text = Title;
        subtitleTextBox.Text = Subtitle;
        ViewSet.SetActiveView(Edit);
    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        ViewSet.SetActiveView(View);
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        VideoID = URLtextBox.Text;
        Title = titleTextBox.Text;
        Subtitle = subtitleTextBox.Text;
        _host.SaveWidgetDataMembers();
        ViewSet.SetActiveView(View);
    }
}