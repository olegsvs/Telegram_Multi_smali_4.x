.class Lorg/telegram/ui/ChatActivity$77$3$1;
.super Ljava/lang/Object;
.source "ChatActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/telegram/ui/ChatActivity$77$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lorg/telegram/ui/ChatActivity$77$3;


# direct methods
.method constructor <init>(Lorg/telegram/ui/ChatActivity$77$3;)V
    .locals 0
    .param p1, "this$2"    # Lorg/telegram/ui/ChatActivity$77$3;

    .prologue
    .line 4803
    iput-object p1, p0, Lorg/telegram/ui/ChatActivity$77$3$1;->this$2:Lorg/telegram/ui/ChatActivity$77$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 4806
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    const/4 v1, 0x1

    iput v1, v0, Lorg/telegram/messenger/MessagesController;->secretWebpagePreview:I

    .line 4807
    sget-object v0, Lorg/telegram/messenger/ApplicationLoader;->applicationContext:Landroid/content/Context;

    sget-object v1, Lorg/telegram/messenger/ApplicationLoader;->mainconfig:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "secretWebpage2"

    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v2

    iget v2, v2, Lorg/telegram/messenger/MessagesController;->secretWebpagePreview:I

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 4808
    iget-object v0, p0, Lorg/telegram/ui/ChatActivity$77$3$1;->this$2:Lorg/telegram/ui/ChatActivity$77$3;

    iget-object v0, v0, Lorg/telegram/ui/ChatActivity$77$3;->this$1:Lorg/telegram/ui/ChatActivity$77;

    iget-object v0, v0, Lorg/telegram/ui/ChatActivity$77;->this$0:Lorg/telegram/ui/ChatActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/telegram/ui/ChatActivity;->access$16002(Lorg/telegram/ui/ChatActivity;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 4809
    iget-object v0, p0, Lorg/telegram/ui/ChatActivity$77$3$1;->this$2:Lorg/telegram/ui/ChatActivity$77$3;

    iget-object v0, v0, Lorg/telegram/ui/ChatActivity$77$3;->this$1:Lorg/telegram/ui/ChatActivity$77;

    iget-object v0, v0, Lorg/telegram/ui/ChatActivity$77;->this$0:Lorg/telegram/ui/ChatActivity;

    iget-object v1, p0, Lorg/telegram/ui/ChatActivity$77$3$1;->this$2:Lorg/telegram/ui/ChatActivity$77$3;

    iget-object v1, v1, Lorg/telegram/ui/ChatActivity$77$3;->this$1:Lorg/telegram/ui/ChatActivity$77;

    iget-object v1, v1, Lorg/telegram/ui/ChatActivity$77;->val$charSequence:Ljava/lang/CharSequence;

    iget-object v2, p0, Lorg/telegram/ui/ChatActivity$77$3$1;->this$2:Lorg/telegram/ui/ChatActivity$77$3;

    iget-object v2, v2, Lorg/telegram/ui/ChatActivity$77$3;->this$1:Lorg/telegram/ui/ChatActivity$77;

    iget-boolean v2, v2, Lorg/telegram/ui/ChatActivity$77;->val$force:Z

    invoke-static {v0, v1, v2}, Lorg/telegram/ui/ChatActivity;->access$12000(Lorg/telegram/ui/ChatActivity;Ljava/lang/CharSequence;Z)V

    .line 4810
    return-void
.end method
