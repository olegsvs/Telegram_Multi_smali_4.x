.class Lorg/telegram/messenger/NotificationsController$10$1;
.super Ljava/lang/Object;
.source "NotificationsController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/telegram/messenger/NotificationsController$10;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/telegram/messenger/NotificationsController$10;


# direct methods
.method constructor <init>(Lorg/telegram/messenger/NotificationsController$10;)V
    .locals 0
    .param p1, "this$1"    # Lorg/telegram/messenger/NotificationsController$10;

    .prologue
    .line 709
    iput-object p1, p0, Lorg/telegram/messenger/NotificationsController$10$1;->this$1:Lorg/telegram/messenger/NotificationsController$10;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 712
    iget-object v0, p0, Lorg/telegram/messenger/NotificationsController$10$1;->this$1:Lorg/telegram/messenger/NotificationsController$10;

    iget-object v0, v0, Lorg/telegram/messenger/NotificationsController$10;->this$0:Lorg/telegram/messenger/NotificationsController;

    iget-object v1, p0, Lorg/telegram/messenger/NotificationsController$10$1;->this$1:Lorg/telegram/messenger/NotificationsController$10;

    iget-object v1, v1, Lorg/telegram/messenger/NotificationsController$10;->val$popupArray:Ljava/util/ArrayList;

    iput-object v1, v0, Lorg/telegram/messenger/NotificationsController;->popupMessages:Ljava/util/ArrayList;

    .line 713
    return-void
.end method
