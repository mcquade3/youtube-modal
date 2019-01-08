<%@ Control Language="C#" AutoEventWireup="true" CodeFile="YouTubeModal.ascx.cs" Inherits="widgets_YouTubeModal" %>
<asp:MultiView ID="ViewSet" runat="server">
    <asp:View ID="View" runat="server">
        <div class="custom-modal">
            <h5><%= Title %></h5>
            <div class="youtube-thumbnail-container">
                <a data-toggle="modal" data-target="#<%= VideoID %>" onclick="openModal('<%= VideoID %>')">
                    <img class="youtube-thumbnail" src="<%= VideoThumbnail %>" alt="Youtube thumbnail" />
                    <span class="youtube-play-button-container">
                        <img class="youtube-play-button" src="/uploadedImages/Youtube-logo-2017.png" alt="Youtube play button" />
                    </span>
                </a>
            </div>
            <p><%= Subtitle %></p>
        </div>

        <!-- Modal -->
        <div id="<%= VideoID %>" class="modal fade" data-keyboard="false" data-backdrop="static" role="dialog" aria-hidden="true">
          <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="closeModal('<%= VideoID %>')">&times;</button>
                <h4 class="modal-title"><%= Title %></h4>
              </div>
              <div class="modal-body">
                <iframe width="100%" height="315" src="" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true" onclick="closeModal('<%= VideoID %>')">Close</button>
              </div>
            </div>
          </div>
        </div>
    </asp:View>
    <asp:View ID="Edit" runat="server">
        <div class="custom-modal">
            <table>
                <tr>
                    <td>Title:</td>
                    <td>
                        <asp:TextBox ID="titleTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                   <td>URL:</td>
                   <td>
                       https://youtu.be/<asp:TextBox ID="URLtextBox" runat="server"></asp:TextBox>
                   </td>
                </tr>
                <tr>
                    <td>Subtitle:</td>
                    <td>
                        <asp:TextBox ID="subtitleTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="CancelButton" runat="server" Text="Cancel" OnClick="CancelButton_Click"/>
            <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click"/>
        </div>
    </asp:View>
</asp:MultiView>